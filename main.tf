provider "aws" {
  region = "eu-central-1"
}

data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

data "aws_vpc" "default" {
  default = true
}