# Create Cloudwatch log group

resource "aws_cloudwatch_log_group" "task" {
  name = "/simple-gaming-service/${var.name}"

  tags = {
    Application = "${var.name}"
  }
}

# Create Targets for EFS file systems 
resource "aws_security_group" "efs" {
  name        = "sgs-efs-${var.name}"
  description = "Control EFS traffic for SGS task ${var.name}"
}

resource "aws_security_group_rule" "efs_ingress" {
  security_group_id        = aws_security_group.efs.id
  type                     = "ingress"
  from_port                = 2049
  to_port                  = 2049
  protocol                 = "TCP"
  source_security_group_id = aws_security_group.task.id
}

## TODO - Turn this into a nice loop over a merged map
resource "aws_efs_mount_target" "subneta" {
  for_each = { for fs in var.efs_file_systems: fs.name => fs }
  
  file_system_id  = each.value.efs_file_system_id
  subnet_id       = local.subnet_ids[0]
  security_groups = [aws_security_group.efs.id] 
}

resource "aws_efs_mount_target" "subnetb" {
  for_each = { for fs in var.efs_file_systems: fs.name => fs }
  
  file_system_id  = each.value.efs_file_system_id
  subnet_id       = local.subnet_ids[1]
  security_groups = [aws_security_group.efs.id] 
}

resource "aws_efs_mount_target" "subnetc" {
  for_each = { for fs in var.efs_file_systems: fs.name => fs }
  
  file_system_id  = each.value.efs_file_system_id
  subnet_id       = local.subnet_ids[2]
  security_groups = [aws_security_group.efs.id] 
}

# Define ECS task

resource "aws_ecs_task_definition" "task" {
  network_mode             = "awsvpc"
  family                   = var.name
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.cpu
  memory                   = var.memory
  execution_role_arn       = var.execution_role_arn
  ephemeral_storage {
    size_in_gib =  "${var.disk}"
  }
  container_definitions = jsonencode([{
   name         = "${var.name}-container"
   image        = "${var.container_image}:latest"
   essential    = true
   portMappings = "${var.port_mappings}"
   environment  = "${var.environment_variables}"
   mountPoints  = "${var.mount_points}"
   logConfiguration = {
    logDriver  = "awslogs"
    options    = {
     "awslogs-group": aws_cloudwatch_log_group.task.name,
     "awslogs-region": "${var.logging_region}",
     "awslogs-stream-prefix": "streaming"   
    } 
   }
  }])
  dynamic "volume" {
    for_each = { for fs in var.efs_file_systems: fs.name => fs }
    content {
      name = volume.value.name
      efs_volume_configuration {
        file_system_id   = volume.value.efs_file_system_id
        root_directory   = volume.value.mount_point
      }
    }
  }
}

# Define Task Security Group

resource "aws_security_group" "task" {
  name        = "sgs-task-${var.name}"
  description = "Control traffic for SGS task ${var.name}"
}

resource "aws_security_group_rule" "ingress" {
  for_each = {for mapping in var.port_mappings: mapping.hostPort => mapping}

  security_group_id = aws_security_group.task.id
  type              = "ingress"
  from_port         = each.value.hostPort
  to_port           = each.value.hostPort
  protocol          = each.value.protocol
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "egress" {
  security_group_id = aws_security_group.task.id
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  ipv6_cidr_blocks  = ["::/0"]
}

# Define ECS Service

resource "aws_ecs_service" "task" {
  # depends_on required to ensure that efs mount points exist before container started
  depends_on = [aws_efs_mount_target.subneta, aws_efs_mount_target.subnetb, aws_efs_mount_target.subnetc]
  name            = var.name
  launch_type     = "FARGATE"
  cluster         = var.sgs_cluster_id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = var.running  == true ? 1 : 0
  wait_for_steady_state = true
  network_configuration {
    subnets = local.subnet_ids
    assign_public_ip = true
    security_groups = [aws_security_group.task.id]
  }
}

# Define DNS Record

data "aws_network_interfaces" "task" {
  # depends_on required as IP address information will not be
  # available until aws_ecs_service.task has been created and the
  # resulting container added to the security group.
  depends_on = [aws_ecs_service.task]
  filter {
    name   = "group-id"
    values = [aws_security_group.task.id]
  }
}

data "aws_network_interface" "task" {
  id = join(",", data.aws_network_interfaces.task.ids)
}

data "aws_route53_zone" "task" {
  name = var.dns_zone
}

resource "aws_route53_record" "task" {
  zone_id = data.aws_route53_zone.task.zone_id
  name    = "${var.name}.${data.aws_route53_zone.task.name}"
  type    = "A"
  ttl     = "60"
  records = tolist( data.aws_network_interface.task[*].association[0].public_ip ) 
}
