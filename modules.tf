module "network" {
  source = "./modules/network"

  cluster_name = var.cluster_name
  region       = var.region
}

module "master" {
  source = "./modules/master"

  cluster_name       = var.cluster_name
  kubernetes_version = var.kubernetes_version

  private_subnet_1a = module.network.private_subnet_1a
  private_subnet_1b = module.network.private_subnet_1b
}

module "service_node" {
  source = "./modules/node"

  cluster_name = var.cluster_name
  node_group_project = "service"
  node_role_arn = module.master.eks_node_role_arn

  instance_types = ["t4g.large"]
  ami_type = "AL2_ARM_64"

  private_subnet_1a = module.network.private_subnet_1a
  private_subnet_1b = module.network.private_subnet_1b

  desired_size = 1
  min_size     = 0
  max_size     = 1

  depends_on = [
    module.master
  ]

}

module "database_node" {
  source = "./modules/node"

  cluster_name = var.cluster_name
  node_group_project = "database"
  node_role_arn = module.master.eks_node_role_arn

  instance_types = ["t3.large"]
  ami_type = "AL2_x86_64"

  private_subnet_1a = module.network.private_subnet_1a
  private_subnet_1b = module.network.private_subnet_1b

  desired_size = 1
  min_size     = 0
  max_size     = 1

  depends_on = [
    module.master
  ]

}

module "eks_blueprints_kubernetes_addons" {
  source = "github.com/aws-ia/terraform-aws-eks-blueprints//modules/kubernetes-addons?ref=v4.32.1"

  eks_cluster_id = module.master.cluster_name

  # EKS Addons
  enable_amazon_eks_vpc_cni            = true
  enable_amazon_eks_coredns            = true
  enable_amazon_eks_kube_proxy         = true
  enable_amazon_eks_aws_ebs_csi_driver = true
  enable_aws_load_balancer_controller  = true
  enable_metrics_server                = true
  enable_kube_prometheus_stack         = true
  enable_cert_manager                  = true

  tags = {
    Environment = "dev"
  }

  depends_on = [
    null_resource.export_kubeconfig
  ]
}
