
######################### 
# General Parameters
#########################

environment = "Bramba"
vpc_cidr = "10.0.0.0/16"
public_sub_cidr  = ["10.0.1.0/24" , "10.0.2.0/24"]
private_sub_cidr = ["10.0.3.0/24" , "10.0.4.0/24"]
aws_region = "us-west-2"


######################### 
# Eks parameters
#########################

cluster_name = "eksCluster"
# number of the nodes
desired      = "2"
max          = "3"
min          = "1"
#EC2 type
EC2_type  = "t2.micro"
#Size of EC2 disk
size_disk    = "20"
# Kubernets Version
kversion = "1.18"

