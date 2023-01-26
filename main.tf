#AWS Loadbalancer Controller
module "aws_load_balancer_controller" {
  source = "./modules/ingress"
  aws_region = local.region
  eks_cluster_name = module.eks.cluster_name
}

