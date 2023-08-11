resource "aws_kms_key" "kms_s3_myteam" {
  description             = "KMS key for the MyTeam all-params S3 bucket"
}

module "s3bucket-all-params" {
    source = "../well.terraform.module.s3bucket"
    bucket_name = "all-params"
    owning_team = "MyTeam"
    kms_key_arn = aws_kms_key.kms_s3_myteam.arn
    tags = {
        ProductName = "MyTeamApp"
        ProductVersion = "1.2.3"
    }
}
