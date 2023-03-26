provider "aws" {
  region = local.region
  default_tags {
    tags = {
      Project     = local.project
      Environment = local.environment
    }
  }
}