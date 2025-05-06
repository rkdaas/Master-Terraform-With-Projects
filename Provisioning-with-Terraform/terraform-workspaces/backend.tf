terraform {
  backend "s3" {
    bucket = "terraform-aws-workspace-s3-bucket"
    key    = "terraform-aws-workspaces/terraform.tfstate"
    region = "ap-south-1"
    dynamodb_table = "terraform-aws-webinfra-table"
    encrypt = true
  }
}
