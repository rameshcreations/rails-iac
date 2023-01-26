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
    self_managed_node_groups = {
      one = {
        name         = "mixed-1"
        max_size     = 5
        desired_size = 2

        use_mixed_instances_policy = true
        mixed_instances_policy = {
          instances_distribution = {
            on_demand_base_capacity                  = 0
            on_demand_percentage_above_base_capacity = 10
            spot_allocation_strategy                 = "capacity-optimized"
          }

          override = [
            {
              instance_type     = "m5.large"
              weighted_capacity = "1"
            },
            {
              instance_type     = "m6i.large"
              weighted_capacity = "2"
            },
          ]
        }
      }
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
