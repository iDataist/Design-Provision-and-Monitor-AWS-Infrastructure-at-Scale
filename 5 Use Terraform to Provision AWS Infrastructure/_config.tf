terraform {
  backend "s3" {
    bucket = "udacity-tf-huiren"
    key    = "terraform/terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}