module "elastic_cluster" {
  source              = "../kubernetes-resource-from-yaml"
  override_namespace  = var.module_namespace
  resource_definition = "${path.module}/yaml-templates/cluster.yaml"
}