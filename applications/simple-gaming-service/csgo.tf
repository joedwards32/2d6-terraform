# CS:GO Simple Gaming Service Task
# =========================================================
/*
module "csgo" {
  source = "../../modules/simple_gaming_service_task"
  name = "csgo"
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
       value = "4B162EA4DA2C0BED1FF3488B0B8C677D"
    },
    {
       name = "SRCDS_GAMETYPE",
       value = 0
    },
    {
       name = "SRCDS_GAMEMODE",
       value = 0
    },
    {
       name = "SRCDS_STARTMAP",
       value = "de_dust2"
    },
    {
       name = "DLURL",
       value = "https://raw.githubusercontent.com/joedwards32/2d6-terraform/master/applications/simple-gaming-service/csgo/"
    }

  ]
}

output "csgo_ecs_service_id" {
  value = module.csgo.ecs_service_id
}

output "csgo_dns_name" {
  value = module.csgo.dns_name
}
*/
