# Create ECS Cluster

resource "aws_ecs_cluster" "sgs" {
  name = "ecs-sgs-${var.name}"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

# Create IAM role
resource "aws_iam_role" "ecs_role" {
  name = "ecs-sgs-${var.name}"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "1",
            "Effect": "Allow",
            "Principal": {
              "Service": "ecs-tasks.amazonaws.com"
              },
            "Action": "sts:AssumeRole"            
        }
    ]
}
EOF

  tags = {
    tag-key = "tag-value"
  }
}

# Attach AmazonECSTaskExecutionRolePolicy, which grants ECS fargate tasks access to fetch images and write logs to cloudwatch, to role
resource "aws_iam_role_policy_attachment" "ecs-task-permissions" {
    role       = aws_iam_role.ecs_role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
