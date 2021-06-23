# Simple Gaming Service
# =========================================================
# Container based gaming servers running on AWS ECS Fargate

# SGS cluster 
module "sgs_cluster" {
  source = "../../modules/simple_gaming_service_cluster"
  name = "2d6"
}
