region = "us-east-1"
// asignar los valores a las variables

cloudfront = {
    name = "fgarcia-cloudfront",
    oia = "Origin access identity bucket fgarcia",
    s3_origin_id = "s3OriginBucketFgarcia",
    default_cache_behavior = {
        viewer_protocol_policy = "redirect-to-https",
        allowed_get = "GET",
        allowed_head = "HEAD",
        forwarded_values_cookies = "none"
    },
    restrictions_type = "none",
    viewer_certificate = {
        minimum_protocol_version = "TLSv1.2_2019",
        ssl_support_method = "sni-only"
    }
}

iam = {
    statement_actions = "s3:GetObject",
    principals_type = "AWS"
}

s3 = {
    bucket = "fgarcia-website-host-angular",
    acl    = "private",
    website = {
        index_document = "index.html",
        error_document = "error.html"
    }
}
