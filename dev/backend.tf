terraform {
  backend "s3" {
    bucket = "tfstate-dev20230326200450109000000001"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}