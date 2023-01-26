variable "tags" {
  description = "The tags to apply to all taggable resources"
  type        = map(string)
}

variable "region" {
  description = "The region to deploy the infrastructure to"
  type        = string
}

variable "name" {
  description = "project name"
  type        = string
}

variable "environment" {
  description = "project environment"
  type        = string
}

variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC."
}

variable "vpc_availability_zones" {
  type        = list(string)
  description = "A list of availability zones names or ids in the region"
}

variable "vpc_private_subnets" {
  type        = list(string)
  description = "A list of private subnets"
}

variable "vpc_public_subnets" {
  type        = list(string)
  description = "A list of public subnets"
}