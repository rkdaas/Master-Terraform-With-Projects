provider "aws" {
  region = var.aws_region
}

module "secure_s3" {
  source = "./modules/s3-cloudfront"
  bucket_name ="my-secure-s3-bucket2k25"
  environment = "dev"
}

