variable "cluster_name" {
  default = "eks-coelhor-dev-001"
}

variable "region" {
  default = "us-east-1"
}

variable "kubernetes_version" {
  default = "1.24"
}

variable "desired_size" {
  default = 1
}

variable "min_size" {
  default = 0
}

variable "max_size" {
  default = 1
}

variable "instance_types" {
  default = ["t3.large"]
}