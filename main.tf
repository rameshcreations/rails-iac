#AWS Loadbalancer Controller
module "aws_load_balancer_controller" {
  source = "./modules/ingress"
  aws_region = local.region
  eks_cluster_name = module.eks.cluster_name
  depends_on = [
    module.eks
  ]
}


#Redis
module "redis" {
  source = "./modules/redis"
  module_architecture = "replication"
  depends_on = [
    module.eks
  ]
}

#Elastic Operator
module "eck-operator" {
  source = "./modules/eck-operator"
  depends_on = [
    module.eks
  ]
}