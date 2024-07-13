terraform {
  backend "s3" {
    bucket = "iaac-backend-store"
    key = "infra.tfstate"
    region = "us-east-1"
  }
}