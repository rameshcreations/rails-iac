variable "resource_definition" {
  description = "Content of the Kubernetes resource definition in YAML format"
  type        = string
}

variable "wait_for_rollout" {
  description = "Wait for the API Server to complete the rollout/creation/deletion of resources"
  type        = bool
  default     = true
}

variable "wait" {
  description = "Wait for finalizers to complete before commencing deletion"
  type        = bool
  default     = false
}

variable "sensitive_fields" {
  description = "List of fields to hide/mark as sensitive, specified in dot syntax"
  type        = list(string)
  default     = null
}

variable "override_namespace" {
  description = "Overrides the namespace specified in the YAML definition"
  type        = string
  default     = null
}

variable "force_new" {
  description = "Forces the deletion and then creation of a resource"
  type        = bool
  default     = false
}