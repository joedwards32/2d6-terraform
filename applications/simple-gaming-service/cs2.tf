# CS2 Simple Gaming Service Task
# =========================================================

variable "cs2_steamuser" {
  type = string
}

variable "cs2_steampass" {
  type = string
}

variable "cs2_pw" {
  type = string
}

variable "cs2_rconpw" {
	  type = string
}

/*
module "cs2" {
  source = "../../modules/simple_gaming_service_task"
  name = "cs2"
  container_image = "joedwards32/cs2"
  cpu = 2048
  memory = 4096
  dns_zone = "2d6.club"
  sgs_cluster_id = module.sgs_cluster.id
  logging_region = var.region
  execution_role_arn = module.sgs_cluster.execution_role_arn
  port_mappings = [
    {
       hostPort = 27015,
       containerPort = 27015
       protocol = "udp"
    },
    {
       hostPort = 27020,
       containerPort = 27020
       protocol = "udp"
    }
  ]
  environment_variables = [
    {
       name = "STEAMUSER",
       value = var.cs2_steamuser
    },
    {
       name = "STEAMPASS",
       value = var.cs2_steampass
    },
    {
       name = "CS2_PW",
       value = var.cs2_pw
    },
    {
       name = "CS2_RCONPW",
       value = var.cs2_rconpw
    },
    {
       name = "CS2_GAMETYPE",
       value = 0
    },
    {
       name = "CS2_GAMEMODE",
       value = 1
    },
    {
       name = "CS2_MAXPLAYERS",
       value = 10
    },
    {
       name = "CS2_BOT_DIFFICULTY",
       value = 2
    },
    {
       name = "CS2_BOT_QUOTA",
       value = 10
    },
    {
       name = "CS2_BOT_QUOTA_MODE",
       value = "fill"
    },
  ]
  efs_client_security_group_id = module.sgs_cluster.efs_clients_security_group_id
  efs_file_systems = [
    {
      name                = "cs2"
      efs_file_system_id  = module.sgs_cluster.efs
      mount_point         = "/cs2-dedicated"
    }
  ]
  mount_points = [
    {
      containerPath       = "/home/steam/cs2-dedicated/"
      sourceVolume        = "cs2"
    }
  ]

}

output "cs2_ecs_service_id" {
  value = module.cs2.ecs_service_id
}

output "cs2_dns_name" {
  value = module.cs2.dns_name
}
*/
