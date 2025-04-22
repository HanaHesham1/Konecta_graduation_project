provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  s3_force_path_style         = true
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  endpoints {
    s3     = "http://localhost:4566"
    ec2    = "http://localhost:4566"
    iam    = "http://localhost:4566"
  }
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = "devops-app-bucket"
}
