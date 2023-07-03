terraform {
  backend "s3" {
    bucket = "kube-store-tf-state"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}
