output "config-map-aws-auth" {
  value = local.config-map-aws-auth
  description = "AWS EKS cluster user access configmap"
  sensitive = true
}

output "kubeconfig" {
   value = local.kubeconfig
   description = "kubeconfig for the AWS EKS cluster"
   sensitive = true
 }
