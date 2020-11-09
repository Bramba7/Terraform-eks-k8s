provider "aws" {
  shared_credentials_file = "~/.aws/credentials"
  region = var.aws_region
}


terraform {
  required_version = ">= 0.12.0"
  backend "s3" {
    shared_credentials_file = "~/.aws/credentials"
    bucket = "bramba-bucket1"
    key    = "terraform/terraform.tfstate"
    region = "us-west-2"
    acl = "private"
    encrypt = true
  }
}
module "vpc" {
    source = "./modules/vpc"

    environment      = var.environment
    vpc_cidr         = var.vpc_cidr
    public_sub_cidr  = var.public_sub_cidr
    private_sub_cidr = var.private_sub_cidr
    aws_region       = var.aws_region
    cluster_name     = var.cluster_name
}

module "iamRole" {
    source = "./modules/iamRole"
    #environment = var.environment
}

module "EKS" {
    source = "./modules/EKS"

    desired                            = var.desired
    EC2_type                           = var.EC2_type
    min                                = var.min
    max                                = var.max
    size_disk                          = var.size_disk
    kversion                           = var.kversion
    cluster_name                       = var.cluster_name
    iam_eks                            = module.iamRole.iam_eks
    iam_node                           = module.iamRole.iam_node
    AmazonEKSWorkerNodePolicy          = module.iamRole.AmazonEKSWorkerNodePolicy
    AmazonEKS_CNI_Policy               = module.iamRole.AmazonEKS_CNI_Policy
    AmazonEC2ContainerRegistryReadOnly = module.iamRole.AmazonEC2ContainerRegistryReadOnly
    AmazonEKSClusterPolicy             = module.iamRole.AmazonEKSClusterPolicy
    AmazonEKSVPCResourceController     = module.iamRole.AmazonEKSVPCResourceController
    AmazonEKSServicePolicy             = module.iamRole.AmazonEKSServicePolicy
    private_subnets                    = module.vpc.private_subnets
    # environment = var.environmentS
}

variable "environment" {}
variable "vpc_cidr" {}
variable "aws_region" {}
variable "cluster_name" {}
variable "desired" {}
variable "max" {}
variable "min" {}
variable "EC2_type" {}
variable "size_disk" {}
variable "kversion" {}

variable "public_sub_cidr" {
   type = list(string)
 }
variable "private_sub_cidr" {
   type = list(string)
 }

