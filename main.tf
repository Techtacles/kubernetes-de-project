module "ec2" {
  source            = "./modules/ec2"
  ec2_instance_type = var.ec2_instance_type
  ec2_monitoring    = var.ec2_monitoring
  ec2_tag_name      = var.ec2_tag_name


}
module "ecr" {
  source              = "./modules/ecr"
  ecr_repository_name = var.ecr_repository_name

}
module "redshift" {
  source                = "./modules/redshift"
  cluster_identifier    = var.cluster_identifier
  redshift_db_name      = var.redshift_db_name
  redshift_username     = var.redshift_username
  redshift_password     = var.redshift_password
  redshift_node_type    = var.redshift_node_type
  redshift_cluster_type = var.redshift_cluster_type

}
module "s3_raw" {
  source      = "./modules/s3"
  bucket_env  = var.bucket_env
  bucket_name = var.bucket_name
  bucket_tag  = var.bucket_tag

}
module "s3_transformed" {
  source      = "./modules/s3"
  bucket_env  = var.bucket_env_trans
  bucket_name = var.bucket_name_trans
  bucket_tag  = var.bucket_tag_trans


}

module "eks" {
  source              = "./modules/eks"
  vpc_id              = var.vpc_id
  eks_cluster_name    = var.eks_cluster_name
  eks_node_group_name = var.eks_node_group_name

}
