resource "aws_eks_cluster" "example" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks-iam-role.arn

  vpc_config {
    subnet_ids = data.aws_subnets.private.ids
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role.eks-iam-role
  ]
}


 resource "aws_eks_node_group" "worker-node-group" {
  cluster_name  = aws_eks_cluster.example.name
  node_group_name = "eks-node-group"
  node_role_arn  = aws_iam_role.workernodes.arn
  subnet_ids   = data.aws_subnets.private.ids
  scaling_config {
   desired_size = 1
   max_size   = 1
   min_size   = 1
  }
 
  depends_on = [
   aws_iam_role_policy_attachment.AmazonEKSWorkerNodePolicy,
   aws_iam_role_policy_attachment.AmazonEKS_CNI_Policy,
   #aws_iam_role_policy_attachment.AmazonEC2ContainerRegistryReadOnly,
  ]
 }

  
