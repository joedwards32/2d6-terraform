# Minecraft Simple Gaming Service Task
# =========================================================

#// PERSISTENT STORAGE - DO NOT DELETE!

resource "aws_efs_file_system" "minecraft" {
  tags = {
    Name = "minecraft"
  }
}

#\\ PERSISTENT STORAGE - DO NOT DELETE!

module "minecraft" {
  source = "../../modules/simple_gaming_service_task"
  name = "minecraft"
  container_image = "itzg/minecraft-server"
  cpu = 1024
  memory = 2048
  dns_zone = "2d6.club"
  sgs_cluster_id = module.sgs_cluster.id  
  logging_region = var.region
  execution_role_arn = module.sgs_cluster.execution_role_arn
  port_mappings = [
    {
       hostPort = 25565,
       containerPort = 25565
       protocol = "tcp"
    }
  ]
  environment_variables = [
    {
       name = "EULA",
       value = "TRUE"
    },
    {
       name = "MOTD",
       value = "Welcome to the 2d6 Minecraft server"
    },
    {
      name = "PVP"
      value = "false"
    }
  ]
  efs_file_systems = [
    {
      name                = aws_efs_file_system.minecraft.tags_all.Name
      efs_file_system_id  = aws_efs_file_system.minecraft.id
      mount_point         = "/"
    }
  ]
  mount_points = [
    {
      containerPath       = "/data/"
      sourceVolume        = aws_efs_file_system.minecraft.tags_all.Name
    }
  ]
}

output "minecraft_ecs_service_id" {
  value = module.minecraft.ecs_service_id
}

output "minecraft_dns_name" {
  value = module.minecraft.dns_name
}
