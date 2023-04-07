resource "aws_s3_bucket" "user_docs" {
  bucket = "${var.bucket_prefix}${var.app_env != "Prod" ? "-dev" : ""}"
  tags   = local.tags
}

data "aws_iam_policy_document" "docs_site_s3_policy" {
  statement {
    actions   = ["s3:GetObject"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.user_docs.id}/*"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.user_docs.iam_arn]
    }
  }
  statement {
    actions   = ["s3:ListBucket"]
    resources = ["arn:aws:s3:::${aws_s3_bucket.user_docs.id}"]

    principals {
      type        = "AWS"
      identifiers = [aws_cloudfront_origin_access_identity.user_docs.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "docs_site_oai" {
  bucket = aws_s3_bucket.user_docs.id
  policy = data.aws_iam_policy_document.docs_site_s3_policy.json
}

resource "aws_s3_bucket_public_access_block" "docs_site_resource_public_access_block" {
  bucket                  = aws_s3_bucket.user_docs.id
  restrict_public_buckets = true
  block_public_acls       = true
  ignore_public_acls      = true
  block_public_policy     = true
}
