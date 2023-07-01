resource "aws_db_instance" "db_instance" {
  allocated_storage    = var.db_storage
  db_name              = var.db_name
  engine               = var.db_engine
  instance_class       = var.db_instance_class
  username             = var.db_username
  password             = var.db_password
}
