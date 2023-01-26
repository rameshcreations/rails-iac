resource "random_password" "redis_pass" {
  length           = 16
  special          = false
  override_special = "-_=+:?"
  min_upper        = 2
  min_lower        = 2
  min_numeric      = 2
}


resource "helm_release" "redis" {
  repository       = "https://charts.bitnami.com/bitnami"
  chart            = "redis"
  version          = var.package_version
  name             = var.module_name
  namespace        = var.module_namespace
  create_namespace = var.module_create_namespace
  values = [
  local.redis_values]
}


