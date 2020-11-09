resource "aws_eks_cluster" "eksCluster" {
  name     = var.cluster_name
  role_arn = var.iam_eks
  version  = var.kversion

  vpc_config {
    subnet_ids = var.private_subnets
    endpoint_private_access = true 
    endpoint_public_access = true
  }
   # We enable control plane components logging against Amazon Cloudwatch log group
  enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"] 

  depends_on = [
    var.AmazonEKSClusterPolicy,
    var.AmazonEKSServicePolicy,
    var.AmazonEKSVPCResourceController,
  ]
}

resource "aws_eks_node_group" "nodeGroup" {
  cluster_name    = aws_eks_cluster.eksCluster.name
  node_group_name = "nodeGroup"
  node_role_arn   = var.iam_node
  subnet_ids      = var.private_subnets
  instance_types  = [var.EC2_type]
  disk_size       = var.size_disk

  scaling_config {
    desired_size = var.desired
    max_size     = var.max
    min_size     = var.min
  }

  depends_on = [
    var.AmazonEKSWorkerNodePolicy,
    var.AmazonEKS_CNI_Policy,
    var.AmazonEC2ContainerRegistryReadOnly,
  ]
}

 # Generate a kubeconfig  
resource "null_resource" "generate_kubeconfig" {

  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name ${var.cluster_name}"
  }

  depends_on = [aws_eks_cluster.eksCluster]
}

# Step 5: Integrating Service Accounts with IAM role
data "tls_certificate" "cluster" {
  url = aws_eks_cluster.eksCluster.identity.0.oidc.0.issuer
}
# We need an open id connector to allow our service account to assume an IAM role
resource "aws_iam_openid_connect_provider" "cluster" { 
  client_id_list = ["sts.amazonaws.com"]
 thumbprint_list = concat([data.tls_certificate.cluster.certificates.0.sha1_fingerprint], [])
             url = aws_eks_cluster.eksCluster.identity.0.oidc.0.issuer
}