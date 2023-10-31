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
  source = "github.com/joedwards32/sgs-task"
  name = "cs2"
  container_image = "joedwards32/cs2"
  sgs_cluster = module.sgs_cluster
  running = true
  cpu = 2048
  memory = 4096
  dns_zone = "2d6.club"
  logging_region = var.region
  port_mappings = [
    {
       hostPort = 27015,
       containerPort = 27015
       protocol = "udp"
    },
    {
       hostPort = 27016,
       containerPort = 27016
       protocol = "tcp"
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
       name = "CS2_RCON_PORT",
       value = 27016
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
       value = 11
    },
    {
       name = "CS2_BOT_DIFFICULTY",
       value = 2
    },
    {
       name = "CS2_BOT_QUOTA",
       value = 11
    },
    {
       name = "CS2_BOT_QUOTA_MODE",
       value = "normal"
    },
    {
       name = "TV_PW",
       value = ""
    },
    {
       name = "TV_ENABLE",
       value = 1
    },
  ]
  volumes = [
    {
      name                = "cs2"
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
