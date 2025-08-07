terraform {
  backend "s3" {
    bucket = "terraform-backend-2k25-bucket"
    key    = "webinfra/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt = true
  }
}
