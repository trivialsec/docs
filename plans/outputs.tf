output "cloudfront_user_docs" {
  value = aws_cloudfront_distribution.user_docs.id
}

output "user_docs_bucket" {
  value = aws_s3_bucket.user_docs.id
}
