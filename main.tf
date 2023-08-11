/** 
 * # well.terraform.module.s3bucket
 * 
 * ## Intro
 * This Terraform module provides an efficient, repeatable way to create S3 buckets via Terraform that meet Well standards and best practices requirements: 
 * - KMS Encryption: can use either a specified key or the default AWS S3 key
 * - Logging of S3 activity
 * - Tags: Optional tags that will be added to the bucket (mandatory tags are automatically included)
 * - Versioning on bucket objects: Versioning is required and included by default
*/


resource "aws_s3_bucket" "s3_b" {
  bucket_prefix = var.bucket_name
  tags = merge(tomap({
    OwningTeam = var.owning_team }),
    var.tags,
  )
}

resource "aws_s3_bucket_versioning" "s3_bv" {
  bucket = aws_s3_bucket.s3_b.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "s3_sse" {
  bucket = aws_s3_bucket.s3_b.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = var.kms_key_arn
      sse_algorithm = "aws:kms"
    }
  }
}