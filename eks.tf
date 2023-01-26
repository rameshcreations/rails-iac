module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.5.1"

  cluster_name    = local.name
  cluster_version = "1.24"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.public_subnets
  manage_aws_auth_configmap      = true
  cluster_endpoint_public_access = true
  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
    aws-ebs-csi-driver = {
      most_recent = true
    }
  }
  eks_managed_node_group_defaults = {
    ami_type = "AL2_x86_64"
  }
  
  eks_managed_node_groups = {
    app_node_group = {
      name = "app-node-group"

      instance_types = ["t3.small"]
      min_size       = 1
      max_size       = 3
      desired_size   = 2

      update_config = {
        max_unavailable_percentage = 50
      }
    }
  }

  kms_key_administrators = [
    "arn:aws:iam::592309593815:role/rails-aws-master-github-oidc",
    "arn:aws:iam::592309593815:user/admin"
  ]

  aws_auth_roles = [
    {
      rolearn  = "arn:aws:iam::592309593815:role/rails-aws-master-github-oidc"
      username = "rails-aws-master-github-oidc"
      groups   = ["system:masters"]
    },
  ]
  aws_auth_users = [
    {
      userarn  = "arn:aws:iam::592309593815:user/admin"
      username = "admin"
      groups   = ["system:masters"]
    },
  ]

  aws_auth_accounts = [
    local.account_id,
  ]

}