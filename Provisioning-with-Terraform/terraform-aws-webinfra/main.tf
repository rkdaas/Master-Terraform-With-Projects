provider "aws" {
  region = var.aws_region
}

# module "secure_s3" {
#   source = "./modules/s3-cloudfront"
#   bucket_name ="my-secure-s3-bucket2k25"
#   environment = "dev"
# }

module "vpc"{
  source="./modules/vpc"
  vpc_cidr=var.vpc_cidr
  public_subnet_cidrs=var.public_subnet_cidrs
  private_subnet_cidrs=var.private_subnet_cidrs
  azs=var.azs
}

