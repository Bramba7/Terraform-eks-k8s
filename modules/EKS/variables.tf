variable "iam_eks" {
  description = "ARN of IAM role"
}
variable "iam_node" {
  description = "ARN of IAM role"
}
variable "AmazonEKSWorkerNodePolicy" {
  description = "Role Policy"
}
variable "AmazonEKS_CNI_Policy" {
  description = "Role Policy"
}
variable "AmazonEC2ContainerRegistryReadOnly" {
  description = "Role Policy"
}
variable "AmazonEKSClusterPolicy" {
  description = "Role Policy"
}
variable "AmazonEKSVPCResourceController" {
  description = "Role Policy"
}
variable "AmazonEKSServicePolicy" {
  description = "Role Policy"
}

variable "private_subnets" {
   type = list(string)
 }
variable "cluster_name" {
  description = "The name of the Amazon EKS cluster."
}

variable "desired" {
  description = "scaling_config."
}
variable "max" {
  description = "scaling_config."
}
variable "min" {
  description = "scaling_config."
}
variable "EC2_type" {
  description = "Ec2 type"
}
variable "size_disk" {
  description = "Ec2 disk size"
}
variable "kversion" {
  description = "Kubernet version"
}

