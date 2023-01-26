resource "helm_release" "aws_ingress" {
  name             = "ingress-nginx"
  chart            = "ingress-nginx"
  repository       = "https://kubernetes.github.io/ingress-nginx"
  version          = var.module_chart_version
  create_namespace = var.module_create_namespace
  namespace        = var.module_namespace
  values           = [
   " ${file("${path.module}/data/nginx-ingress.yaml")}"
    ]
  reuse_values     = false
}