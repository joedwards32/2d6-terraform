# TF2 Simple Gaming Service Task
# =========================================================
/*
module "tf2" {
  source = "github.com/joedwards32/sgs-task"
  name = "tf2"
  container_image = "cm2network/tf2"
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
       value = "D311B061A595524B7B76C14D352669EC"
    },
    {
       name = "SRCDS_MAXPLAYERS",
       value = "24"
    },
    {
       name = "DLURL",
       value = "https://raw.githubusercontent.com/joedwards32/2d6-terraform/master/applications/simple-gaming-service/tf2/"
    }
  ]
}

output "tf2_ecs_service_id" {
  value = module.tf2.ecs_service_id
}

output "tf2_dns_name" {
  value = module.tf2.dns_name
}
*/
