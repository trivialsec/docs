locals {
  aws_master_account_id = 984310022655
  hosted_zone           = "Z04169281YCJD2GS4F5ER"
  aws_default_region    = "ap-southeast-2"
  apex_domain           = "trivialsec.com"
  acm_arn               = "arn:aws:acm:us-east-1:${local.aws_master_account_id}:certificate/8ba67bad-47e9-4936-a860-d47ae4bafba6" #this needs to be us-east-1, do not change
  mime_types = {
    "css"  = "text/css"
    "html" = "text/html"
    "ico"  = "image/vnd.microsoft.icon"
    "js"   = "application/javascript"
    "json" = "application/json"
    "map"  = "application/json"
    "png"  = "image/png"
    "jpg"  = "image/jpeg"
    "jpeg" = "image/jpeg"
    "svg"  = "image/svg+xml"
    "txt"  = "text/plain"
    "xml"  = "text/xml"
    "ttf"  = "application/octet-stream"
    "gz"   = "application/octet-stream"
  }
  tags = {
    ProjectName      = "user-docs"
    ProjectLeadEmail = "chris@trivialsec.com"
    CostCenter       = var.app_env != "Prod" ? "randd" : "opex"
    SecurityTags     = "public-data"
    AutomationTool   = "Terraform"
  }
}
