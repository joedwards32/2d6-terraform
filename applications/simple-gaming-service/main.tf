# Simple Gaming Service
# =========================================================
# Container based gaming servers running on AWS ECS Fargate

# SGS cluster 
module "sgs_cluster" {
  source = "github.com/joedwards32/sgs-cluster"
  name = "2d6"
}
