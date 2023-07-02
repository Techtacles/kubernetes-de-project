variable "ec2_instance_type" {
  type = string

}
variable "ec2_monitoring" {
  type = bool

}
variable "ec2_tag_name" {
  type = string

}
variable "ec2_ami" {
  type = string

}


variable "ecr_repository_name" {
  type = string

}


variable "vpc_id" {
  type = string

}
variable "eks_cluster_name" {
  type = string

}

variable "eks_node_group_name" {
  type = string

}


variable "cluster_identifier" {
  type = string

}
variable "redshift_db_name" {
  type = string

}
variable "redshift_username" {
  type = string

}
variable "redshift_password" {
  type = string

}
variable "redshift_node_type" {
  type = string

}
variable "redshift_cluster_type" {
  type = string

}

variable "bucket_name" {
  type = string

}
variable "bucket_tag" {
  type = string

}
variable "bucket_env" {
  type = string

}

variable "bucket_name_trans" {
  type = string

}
variable "bucket_tag_trans" {
  type = string

}
variable "bucket_env_trans" {
  type = string

}

variable "enable_all" {
  type = bool

}
