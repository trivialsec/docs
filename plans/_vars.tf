variable "aws_access_key_id" {
  description = "AWS_ACCESS_KEY_ID"
  type        = string
  default     = null
}
variable "bucket_prefix" {
  description = "bucket_prefix"
  type        = string
  default     = "trivialsec-user-docs"
}
variable "app_env" {
  description = "default Dev"
  type        = string
  default     = "Dev"
}
