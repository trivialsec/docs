resource "aws_s3_object" "dist" {
  for_each = fileset("${abspath(path.module)}/../dist", "**/*")

  bucket       = aws_s3_bucket.user_docs.id
  key          = each.value
  source       = "${abspath(path.module)}/../dist/${each.value}"
  content_type = lookup(tomap(local.mime_types), element(split(".", each.key), length(split(".", each.key)) - 1))
  etag         = filemd5("${abspath(path.module)}/../dist/${each.value}")
}
