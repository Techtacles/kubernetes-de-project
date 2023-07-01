resource "aws_redshift_cluster" "redshift_cluster" {
  cluster_identifier = var.cluster_identifier
  database_name      = var.redshift_db_name
  master_username    = var.redshift_username
  master_password    = var.redshift_password
  node_type          = var.redshift_node_type
  cluster_type       = var.redshift_cluster_type

}
