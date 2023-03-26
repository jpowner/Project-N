module "statebackend" {
  source        = "../modules/statebackend"
  bucket_name   = "tfstate-dev"
  dynamodb_name = "tfstate-dev"
}