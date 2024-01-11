terraform {
    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 4.16"
        }
    }

    required_version = ">= 1.2.0"
}

provider "aws" {
    region = "us-east-2"
}

resource "aws_s3_bucket" "example" {
    bucket = "anusha-tf-bucket"
}

resource "aws_s3_bucket_ownership_controls" "example" {
    bucket = aws_s3_bucket.example.id
    rule {
        object_ownership = "BucketOwnerPreferred"
    }
}
