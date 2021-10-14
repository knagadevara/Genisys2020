resource "aws_s3_bucket" "s3dopler_amrish" {
    bucket = "GratulertIndiener"
}

output "s3_bucket_domain_name" {
    value = aws_s3_bucket.s3dopler_amrish.bucket_domain_name
}