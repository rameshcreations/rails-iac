# Namespace
variable "module_namespace" {
  description = "Ingress namespace"
  type        = string
  default     = "nginx-ingress"
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
  default     = "4.4.2"
}
