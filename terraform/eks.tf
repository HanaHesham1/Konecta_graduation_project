module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "konecta-eks-cluster"
  cluster_version = "1.27"

  subnet_ids         = aws_subnet.private[*].id
  vpc_id             = aws_vpc.main.id

  # Node group config
  eks_managed_node_groups = {
    dev-ng = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_types = ["t3.medium"]
    }
  }

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
