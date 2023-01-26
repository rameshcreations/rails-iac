# Redis name
variable "module_name" {
  description = "Module name"
  type        = string
  default     = "redis"
}

# Redis package version
variable "package_version" {
  description = "Helm package version"
  type        = string
  default     = "15.7.5"
}

# Module namespace
variable "module_namespace" {
  description = "Namespace for the module"
  type        = string
  default     = "redis"
}

# Create namespace if not exists
variable "module_create_namespace" {
  description = "Indicates whether to create namespace if it does not exist"
  type        = bool
  default     = true
}

# Architecture
variable "module_architecture" {
  description = "Architecture: standalone or replication"
  type        = string
  default     = "standalone"
}

# List of extra flags on initialization
variable "extra_flags" {
  description = "Array with additional command line flags for Redis"
  type        = list(string)
  default     = ["--maxmemory-policy noeviction"]
}
