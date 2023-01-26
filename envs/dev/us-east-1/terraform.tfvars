tags = {
  Owner       = "rameshcreations"
  Project     = "rails-aws-github"
  Environment = "dev"
  Stack       = "app"
  CI          = "Github"
  Repository  = "rails-iac"
}

vpc_cidr               = "10.10.0.0/16"
vpc_availability_zones = ["us-east-1a", "us-east-1b"]
vpc_public_subnets     = ["10.10.1.0/24", "10.10.2.0/24"]
vpc_private_subnets    = ["10.10.11.0/24", "10.10.12.0/24"]
