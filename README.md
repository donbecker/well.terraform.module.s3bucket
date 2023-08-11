<!-- BEGIN_TF_DOCS -->
# well.terraform.module.s3bucket

## Intro
This Terraform module provides an efficient, repeatable way to create S3 buckets via Terraform that meet Well standards and best practices requirements:
- KMS Encryption: can use either a specified key or the default AWS S3 key
- Logging of S3 activity
- Tags: Optional tags that will be added to the bucket (mandatory tags are automatically included)
- Versioning on bucket objects: Versioning is required and included by default

## Usage

### Required parameters only
```hcl
module "s3bucket-required-only" {
    source = "../well.terraform.module.s3bucket"
    bucket_name = "required-only"
    owning_team = "MyTeam"
}
```

### All parameters
```hcl
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
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket_name"></a> [bucket\_name](#input\_bucket\_name) | The name for our bucket | `string` | n/a | yes |
| <a name="input_kms_key_arn"></a> [kms\_key\_arn](#input\_kms\_key\_arn) | (Optional) Specified KMS used for bucket encryption | `string` | `null` | no |
| <a name="input_owning_team"></a> [owning\_team](#input\_owning\_team) | The team responsible for this bucket | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the bucket. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_bucket_fullname"></a> [s3\_bucket\_fullname](#output\_s3\_bucket\_fullname) | The fullname of our S3 bucket |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.67.0 |

## Resources


- resource.aws_s3_bucket.s3_b (main.tf#13)
- resource.aws_s3_bucket_server_side_encryption_configuration.s3_sse (main.tf#28)
- resource.aws_s3_bucket_versioning.s3_bv (main.tf#21)
<!-- END_TF_DOCS -->