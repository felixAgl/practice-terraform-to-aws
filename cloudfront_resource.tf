resource "aws_cloudfront_origin_access_identity" "oai" {
  // Completar los campos para crear el origin access identity, necesario para vincular
  // el bucket de s3 con el cloudfront
  comment = var.cloudfront.oia

}

resource "aws_cloudfront_distribution" "distribution" {
  // Completar los campos para crear el cloudfront
  // El cloudfront debe llamarse <nombre de usuario cidenet>-distribution-angular

  origin {

    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }

    domain_name = aws_s3_bucket.bucket.bucket_regional_domain_name
    origin_id   = var.cloudfront.s3_origin_id
  }

  enabled = true

  default_cache_behavior {
    // usar el metodo de redirect-to-https en el campo viewer_protocol_policy
    viewer_protocol_policy = var.cloudfront.default_cache_behavior.viewer_protocol_policy
    compress               = true
    allowed_methods        = [var.cloudfront.default_cache_behavior.allowed_get, var.cloudfront.default_cache_behavior.allowed_head]
    cached_methods         = [var.cloudfront.default_cache_behavior.allowed_get, var.cloudfront.default_cache_behavior.allowed_head]
    target_origin_id       = var.cloudfront.s3_origin_id
    min_ttl                = 0
    default_ttl            = 86400
    max_ttl                = 31536000

    forwarded_values {
      // Usar el valor de none en las cookies
      query_string = false
      cookies {
        forward = var.cloudfront.default_cache_behavior.forwarded_values_cookies
      }
    }
  }

  restrictions {
    //No deben haber georestricciones
    geo_restriction {
      restriction_type = var.cloudfront.restrictions_type
    }
  }

  viewer_certificate {
    //Debe usarse el certificado que tiene cloudfront por defecto
    cloudfront_default_certificate = true
  }

  # custom_error_response {
  #   //Las paginas custom deben ser index.html
  # }

  # custom_error_response {
  #   //Las paginas custom deben ser index.html
  # }

}
