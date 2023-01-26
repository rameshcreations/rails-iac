locals {
  ingress_nginx_helm_config_vars = {
    cluster_name           = var.eks_cluster_name
    region                 = var.aws_region
  }
  template_path                   = "${path.module}/data/eks-loadbalancer-controller.yaml"
  ingress_nginx_helm_chart_values = templatefile(local.template_path, local.ingress_nginx_helm_config_vars)
}