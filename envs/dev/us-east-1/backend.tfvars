region         = "us-east-1"
bucket         = "rails-aws-master"
key            = "dev/us-east-1/app/terraform.tfstate"
dynamodb_table = "rails-aws-master-terraform-state-lock"
encrypt        = "true"
profile        = "rails-aws"
