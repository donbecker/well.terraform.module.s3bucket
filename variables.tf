variable "bucket_name" {
  description = "The name for our bucket"
  type        = string
  # no default
  #default     = "bucket_name"
}

variable "owning_team" {
  description = "The team responsible for this bucket"
  type        = string
  # no default
  #default     = "owning_team"
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the bucket."
  type        = map(string)
  default     = {}
}

variable "kms_key_arn" {
  description = "(Optional) Specified KMS used for bucket encryption"
  type        = string
  # default is default S3 key
  default = null
}