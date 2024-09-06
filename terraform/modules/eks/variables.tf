variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "cluster_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster."
  type        = string
}

variable "node_group_name" {
  description = "The name of the node group."
  type        = string
}

variable "node_role_arn" {
  description = "The ARN of the IAM role for the EKS nodes."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster."
  type        = list(string)
}

variable "desired_size" {
  description = "Desired number of worker nodes."
  type        = number
}

variable "max_size" {
  description = "Maximum number of worker nodes."
  type        = number
}

variable "min_size" {
  description = "Minimum number of worker nodes."
  type        = number
}

variable "instance_types" {
  description = "Type of instance deployed under nodegroup."
  type        = list(string)
}
