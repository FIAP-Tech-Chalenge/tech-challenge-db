provider "aws" {
  region = "us-east-1"

  assume_role {
    role_arn     = "arn:aws:iam::135488045194:role/voclabs/user3240016=business.mwtelles@gmail.com"
    session_name = "TerraformSession"
  }
}