# terraform {
#   required_providers {
#     vault = {
#       source  = "hashicorp/vault"
#       version = "4.3.0"
#     }
#   }
# }
provider "vault" {
  address = "https://172.31.90.69:8200"
  token = var.vault_token
  skip_tls_verify = true
}

variable "vault_token"{}

data "vault_kv_secret_v2" "example" {
  name  = "my_credentials"
  mount = "test"
}

resource "local_file" "foo" {
  content  =  jsonencode(data.vault_kv_secret_v2.example.data_json)
  filename = "/tmp/secret"
}