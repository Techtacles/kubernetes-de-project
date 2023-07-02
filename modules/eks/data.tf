data "aws_subnets" "private" {
  filter {
    name   = "vpc-id"
    values = [var.vpc_id]
  }

  filter {
    name = "availability-zone"
    values = ["us-east-1a","us-east-1b","us-east-1c","us-east-1d"]
  }


}
output "selected_ids" {
  value = data.aws_subnets.private.id
  
}
