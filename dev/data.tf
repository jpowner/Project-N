data "aws_availability_zones" "available" {
  state = "available"
}

data "aws_ami" "amzn_linux" {
  owners = ["137112412989"] # Red Hat
  filter {
    name   = "name"
    values = ["al2023-ami-2023.0.20230322.0-kernel-6.1-x86_64"]
  }
}