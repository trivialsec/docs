data "terraform_remote_state" "prod_lambda_api" {
  backend = "s3"
  config = {
    bucket = "stateful-trivialsec"
    key    = "terraform/trivialscan-lambda"
    region = "ap-southeast-2"
  }
}
data "terraform_remote_state" "dev_lambda_api" {
  backend = "s3"
  config = {
    bucket = "stateful-trivialsec"
    key    = "terraform/dev/trivialscan-lambda"
    region = "ap-southeast-2"
  }
}
