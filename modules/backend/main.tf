terraform {
  required_version = "~>1.2.9"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.2.3"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}


provider "aws" {
  region  = "eu-west-1"
  profile = "and"
}

resource "aws_s3_bucket" "backend" {
  bucket = "terraform-vms-ansible-demo-backend"

  tags = {
    Terraform   = "true"
    "Project"   = "Ansible-demo-IaaC-Guild"
    Contact     = "alex.mavrogiannis"
    Environment = "Backend"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3-backend-security" {
  bucket = aws_s3_bucket.backend.bucket
  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_policy" "s3-backend-policy" {
  bucket = aws_s3_bucket.backend.id
  policy = aws_s3_bucket_policy.s3_backend_policy.policy
}

resource "aws_s3_bucket_policy" "s3_backend_policy" {
  bucket = aws_s3_bucket.backend.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:sts::948754295911:assumed-role/Okta_Cloud_South_AWS_Developer/alexander.mavrogiannis@and.digital"
            },
            "Action": "s3:ListBucket",
            "Resource": "arn:aws:s3:::${aws_s3_bucket.backend.bucket}"
        },
        {
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:sts::948754295911:assumed-role/Okta_Cloud_South_AWS_Developer/alexander.mavrogiannis@and.digital"
            },
            "Action": [
                "s3:GetObject",
                "s3:PutObject"
            ],
            "Resource": "arn:aws:s3:::${aws_s3_bucket.backend.bucket}/*"
        }
    ]
}
EOF
}

resource "aws_s3_bucket_acl" "backend" {
  bucket = aws_s3_bucket.backend.id
  acl    = "private"
}

resource "aws_s3_bucket_public_access_block" "s3-backend" {
  bucket = aws_s3_bucket.backend.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = true
}

resource "aws_dynamodb_table" "terraform-lock" {
  name           = "terraform-vms-ansible-demo-backend"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
    "Project" = "Ansible-demo-IaaC-Guild"
    "Contact" = "alex.mavrogiannis"
  }
}