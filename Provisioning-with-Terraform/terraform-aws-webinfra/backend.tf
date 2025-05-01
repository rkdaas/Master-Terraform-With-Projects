terraform {
  backend "s3" {
    bucket = "terraform-aws-webinfra-s3-bucket"
    key    = "webinfra/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-aws-webinfra-table"
    encrypt = true
  }
}
