module "s3bucket-required-only" {
    source = "../well.terraform.module.s3bucket"
    bucket_name = "required-only"
    owning_team = "MyTeam"
}