output "eks_cluster_endpoint" {
  value = aws_eks_cluster.eksCluster.endpoint
}

output "eks_cluster_certificat_authority" {
  value = aws_eks_cluster.eksCluster.certificate_authority 
}
