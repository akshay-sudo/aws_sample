
output "cluster_role_arn" {
    value = aws_iam_role.eks_cluster.arn
}

output "node_role_arn" {
    value = aws_iam_role.eks_nodes.arn
}

// Define an output block to expose the name of the EKS cluster
output "eks_cluster_name" {
  // Set the value of the output to be the name of the EKS cluster
  value = aws_eks_cluster.aws_eks.name
}