output "iam_eks" {
  description = "ARN of IAM role"
  value = aws_iam_role.eksRole.arn
}
output "iam_node" {
  description = "ARN of IAM role"
  value = aws_iam_role.nodeRole.arn
}

output "AmazonEKSWorkerNodePolicy" {
  description = "Role Policy"
  value = aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy
}
output "AmazonEKS_CNI_Policy" {
  description = "Role Policy"
  value = aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy
}
output "AmazonEC2ContainerRegistryReadOnly" {
  description = "Role Policy"
  value = aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly
}
output "AmazonEKSClusterPolicy" {
  description = "Role Policy"
  value = aws_iam_role_policy_attachment.AmazonEKSClusterPolicy
}
output "AmazonEKSVPCResourceController" {
  description = "Role Policy"
  value = aws_iam_role_policy_attachment.AmazonEKSVPCResourceController
}
output "AmazonEKSServicePolicy" {
  description = "Role Policy"
  value = aws_iam_role_policy_attachment.AmazonEKSServicePolicy
}

