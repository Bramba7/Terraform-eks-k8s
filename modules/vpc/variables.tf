variable "vpc_cidr" {
  description = "VPC cidr block."
}
variable "public_sub_cidr" {
  type = list(string)
  description = "subnet cidr block."
}
variable "private_sub_cidr" {
  type = list(string)
  description = "subnet cidr block."
}


variable "environment" {
  description = "The name of the environment"
}
variable "aws_region"{
    description = "The Amazon Region"
 }

variable "cluster_name" {
  description = "The name of the Amazon EKS cluster."
}