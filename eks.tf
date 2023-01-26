module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.5.1"

  cluster_name    = local.name
  cluster_version = "1.24"

  vpc_id                         = module.vpc.vpc_id
  subnet_ids                     = module.vpc.public_subnets
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

    eks_managed_node_group_defaults = {
      ami_type = "AL2_x86_64"
    }

    eks_managed_node_groups = {
      app_node_group = {
        name = "app-node-group"

        instance_types = ["t3.small"]
        capacity_type  = "SPOT"
        min_size       = 1
        max_size       = 3
        desired_size   = 2
      }
    }

    # Fargate Profile(s)
    fargate_profiles = {
      default = {
        name = "default"
        selectors = [
          {
            namespace = "default"
          }
        ]
      }
    }
  }
}
