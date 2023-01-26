resource "helm_release" "aws_ingress" {
  name             = var.module_ingress_class
  chart            = "aws-load-balancer-controller"
  repository       = "https://aws.github.io/eks-charts"
  version          = var.module_chart_version
  create_namespace = var.module_create_namespace
  namespace        = var.module_namespace
  values           = [local.ingress_nginx_helm_chart_values]
  reuse_values     = false
}