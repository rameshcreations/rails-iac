# name
variable "module_name" {
  description = "Module name"
  type        = string
  default     = "eck-operator"
}

# package version
variable "package_version" {
  description = "Helm package version"
  type        = string
  default     = "2.6.1"
}

# Module namespace
variable "module_namespace" {
  description = "Namespace for the module"
  type        = string
}

# Create namespace if not exists
variable "module_create_namespace" {
  description = "Indicates whether to create namespace if it does not exist"
  type        = bool
  default     = true
}

# Replica Count
variable "eck_operator_replica_count" {
  description = "Operator Pod Replica Count"
  type        = number
  default     = 2
}