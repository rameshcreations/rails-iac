resource "helm_release" "eck_operator" {
  repository       = "https://helm.elastic.co"
  chart            = "elastic"
  version          = var.package_version
  name             = var.module_name
  namespace        = var.module_namespace
  create_namespace = var.module_create_namespace
  values = [
  local.eck_values]
}


