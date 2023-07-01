resource "aws_ecrpublic_repository" "ecr" {

  repository_name = var.ecr_repository_name
}
