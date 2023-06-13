provider "aws" {
  profile    = "Terraform-user"
  access_key = "AKIARRON3VD52XGH3KHE"
  secret_key = "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"
  region     = "eu-central-1"
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-test-bucket-06-05-197-narasimha-raju"
  tags = {
    Name        = "My-Bucket"
    Environment = "Test"
  }
}

