## S3 bucket

resource "aws_s3_bucket" "b-genisys2020" {
bucket = "terraform-state-backend-genisys2020"
acl    = "private"
force_destroy = false
versioning {
    enabled = true
}

object_lock_configuration {
    object_lock_enabled = "Enabled"
}

server_side_encryption_configuration {  
  rule {
  apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
            }
        }
    }

  tags = {
    Name        = "TestStater"
    Environment = "PRD"
  }
}