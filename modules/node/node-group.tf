resource "aws_eks_node_group" "eks_node_group" {

  cluster_name    = var.cluster_name
  node_group_name = format("%s-node-group", var.node_group_project)
  node_role_arn   = var.node_role_arn
  instance_types  = var.instance_types
  ami_type        = var.ami_type

  subnet_ids = [
    var.private_subnet_1a,
    var.private_subnet_1b
  ]

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }
}