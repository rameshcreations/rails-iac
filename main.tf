#Nginx Ingress
module "nginx-ingress" {
  source           = "./modules/nginx-ingress"
  depends_on = [
    module.eks
  ]
}

#Redis
module "redis" {
  source              = "./modules/redis"
  module_architecture = "replication"
  depends_on = [
    module.eks
  ]
}

#Elastic Operator
module "eck_operator" {
  source           = "./modules/eck-operator"
  module_namespace = local.elastic_namespace
  depends_on = [
    module.eks
  ]
}

#Elastic Cluster
module "elastic_cluster" {
  source              = "./modules/kubernetes-resource-from-yaml"
  override_namespace  = local.elastic_namespace
  resource_definition = local.elastic_cluster_deployment_yaml
  depends_on = [
    module.eck_operator
  ]
}

#Kibana
module "kibana" {
  source              = "./modules/kubernetes-resource-from-yaml"
  override_namespace  = local.elastic_namespace
  resource_definition = local.kibana_deployment_yaml
  depends_on = [
    module.eck_operator,
    module.elastic_cluster
  ]
}