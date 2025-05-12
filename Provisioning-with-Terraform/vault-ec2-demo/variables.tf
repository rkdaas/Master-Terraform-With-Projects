variable "login_approle_role_id" {
  description = "Role ID for AppRole authentication"
  type        = string
  
}

variable "login_approle_secret_id" {
  description = "Secret ID for AppRole authentication"
  type        = string
}

variable "vault_token"{
  description = "Token for Vault authentication"
  type        = string
}