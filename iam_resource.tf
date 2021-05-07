data "aws_iam_policy_document" "s3Policy" {
  // completar los campos para crear el policy de S3
  statement {
    // solo se le debe permitir al cloudfront que haga consulta de objetos usando statement_actions = "s3:GetObject"
    actions   = [var.iam.statement_actions]
    resources = ["${aws_s3_bucket.bucket.arn}/*"]
    principals {
      type        = var.iam.principals_type
      identifiers = [aws_cloudfront_origin_access_identity.oai.iam_arn]
    }
  }
}

resource "aws_s3_bucket_policy" "bucketPolicy" {
  bucket = aws_s3_bucket.bucket.id
  policy = data.aws_iam_policy_document.s3Policy.json
}
