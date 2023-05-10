resource "aws_route53_record" "docs_a" {
  zone_id = local.hosted_zone
  name    = "${var.app_env != "Prod" ? "dev-docs" : "docs"}.${local.apex_domain}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.user_docs.domain_name
    zone_id                = aws_cloudfront_distribution.user_docs.hosted_zone_id
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "docs_aaaa" {
  zone_id = local.hosted_zone
  name    = "${var.app_env != "Prod" ? "dev-docs" : "docs"}.${local.apex_domain}"
  type    = "AAAA"

  alias {
    name                   = aws_cloudfront_distribution.user_docs.domain_name
    zone_id                = aws_cloudfront_distribution.user_docs.hosted_zone_id
    evaluate_target_health = false
  }
}
