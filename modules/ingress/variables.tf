# Namespace
variable "module_namespace" {
  description = "Ingress namespace"
  type        = string
  default     = "ingress"
}

# Create namespace if not exists
variable "module_create_namespace" {
  description = "Indicates whether to create namespace if it does not exist"
  type        = bool
  default     = true
}

variable "module_chart_version" {
  description = "Version of helm chart for nginx-ingress - https://github.com/kubernetes/ingress-nginx"
  type        = string
  default     = "1.4.7"
}

variable "module_ingress_class" {
  description = "Variable for ingress class, used for multiple nginx ingress controller deployments"
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "aws_region" {
  description = "AWS Region of the EKS Cluster"
  type        = string
}

variable "eks_cluster_name" {
description = "AWS EKS Cluster Name"
  type        = string
}