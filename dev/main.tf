module "statebackend" {
  source        = "../modules/statebackend"
  bucket_name   = "tfstate-dev"
  dynamodb_name = "tfstate-dev"
}

module "network" {
  source             = "../modules/network"
  cidr_block         = "10.1.0.0/16"
  public_subnets     = ["10.1.0.0/24"]
  private_subnets    = ["10.1.1.0/24"]
  availability_zones = data.aws_availability_zones.available.names
}

module "security" {
  source           = "../modules/security"
  vpc_id           = module.network.vpc_id
}

module "iam" {
  source           = "../modules/iam"
}

module "compute" {
  source                = "../modules/compute"
  ami                   = data.aws_ami.amzn_linux.id
  instance_type         = "t2.micro"
  public_subnet_id      = module.network.public_subnet_ids[0]
  root_volume_size      = 8
  ssm_role_profile_name = module.iam.ssm_role_profile_name
}
