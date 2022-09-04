terraform {
  cloud {
    organization = "personal-testing-terraform"

    workspaces {
      name = "terraform-github-actions-test-2"
    }
  }
}
provider "aws" {

}

resource "aws_s3_bucket" "b" {
  bucket = var.bucket_name

  tags = {
    Name        = var.bucket_tag
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.b.id
  acl    = "private"
}