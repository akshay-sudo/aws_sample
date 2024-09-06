module "vpc" {
  source = "./modules/vpc"

  cidr_block           = "10.0.0.0/16"
  availability_zones   = ["us-west-2a", "us-west-2b", "us-west-2c"]
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  public_subnet_count  = 3
  private_subnet_count = 3
  tags                 = {
    Name = "vpc-example"
  }
}

module "eks" {
  source = "./modules/eks"

  cluster_name    = "my-cluster"
  cluster_role_arn = module.eks.cluster_role_arn
  node_group_name = "my-node-group"
  node_role_arn   = module.eks.node_role_arn
  subnet_ids      = module.vpc.public_subnet_ids
  desired_size    = 3
  max_size        = 3
  min_size        = 3
  instance_types = ["t3.medium", "t3.large"]
}
