output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.id
}

output "endpoint" {
  value = aws_eks_cluster.eks_cluster.endpoint
}

output "key" {
  value = aws_eks_cluster.eks_cluster.certificate_authority.0.data
}

output "eks_node_role_arn" {
  value = aws_iam_role.eks_node_role.arn
}