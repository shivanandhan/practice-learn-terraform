terraform {
  backend "s3" {
    bucket = "nterraform-practice"
    key    = "sample/terraform-tfstate"
    region = "us-east-1"
  }
}

resource "null_resource" "test"{}