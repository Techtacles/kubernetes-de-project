output "ecr_repo_arn" {
    value = aws_ecrpublic_repository.ecr.arn
  
}
output "ecr_repo_name" {
    value = aws_ecrpublic_repository.ecr.id
  
}
output "ecr_repo_id" {
    value = aws_ecrpublic_repository.ecr.repository_uri
  
}
