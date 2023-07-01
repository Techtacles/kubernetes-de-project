output "cluster_arn" {
    value = aws_redshift_cluster.redshift_cluster.arn
  
}
output "cluster_id" {
    value = aws_redshift_cluster.redshift_cluster.id
  
}
output "cluster_identifier" {
    value = aws_redshift_cluster.redshift_cluster.cluster_identifier
  
}
output "cluster_type" {
    value = aws_redshift_cluster.redshift_cluster.cluster_type
  
}

output "node_type" {
    value = aws_redshift_cluster.redshift_cluster.node_type
  
}
output "redshift_db_name" {
    value = aws_redshift_cluster.redshift_cluster.database_name
  
}
output "cluster_endpoint" {
    value = aws_redshift_cluster.redshift_cluster.endpoint
  
}
output "cluster_port" {
    value = aws_redshift_cluster.redshift_cluster.port
  
}
