# CS:GO Simple Gaming Service Task
# =========================================================
/*
module "csgo-dm" {
  source = "../../modules/simple_gaming_service_task"
  name = "csgo-dm"
  container_image = "cm2network/csgo"
  cpu = 1024
  memory = 2048
  disk = 40
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
       name = "SRCDS_PW",
       value = "2d6"
    },
    {
       name = "SRCDS_RCONPW",
       value = "2d6"
    },
    {
       name = "SRCDS_TOKEN",
       value = "F142BAD0723A0AF43E7619F1170DE305"
    },
    {
       name = "SRCDS_GAMETYPE",
       value = 1
    },
    {
       name = "SRCDS_GAMEMODE",
       value = 2
    },
    {
       name = "SRCDS_STARTMAP",
       value = "de_inferno"
    },
    {
       name = "SRCDS_MAXPLAYERS",
       value = 20
    },
    {
       name = "DLURL",
       value = "https://raw.githubusercontent.com/joedwards32/2d6-terraform/master/applications/simple-gaming-service/csgo/"
    },
    {
       name = "SRCDS_FPSMAX",
       value = 300
    },
    {
       name = "SRCDS_TICKRATE",
       value = 128
    }

  ]
}

output "csgo-dm_ecs_service_id" {
  value = module.csgo-dm.ecs_service_id
}

output "csgo-dm_dns_name" {
  value = module.csgo-dm.dns_name
}
*/
