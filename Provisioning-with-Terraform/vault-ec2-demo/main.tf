provider "aws" {
  region = "ap-south-1"
}

provider "vault" {
  address = "http://127.0.0.1:8200"
  token="vault_token"
  auth_login {
    path = "auth/approle/login"
    parameters = {
      role_id   = var.login_approle_role_id
      secret_id = var.login_approle_secret_id
    }
  }
}

data "vault_kv_secret_v2" "example" {
  mount = "secret"
  name  = "test-secret"
}

resource "aws_instance" "example" {
    ami= "ami-0e35ddab05955cf57"
    instance_type = "t2.micro"
    tags = {
        Name = "example-instance"
        secret= data.vault_kv_secret_v2.example.data["username"]
    }
}