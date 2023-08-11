output "s3_bucket_fullname" {
  description = "The fullname of our S3 bucket"
  value       = aws_s3_bucket.s3_b.id
}