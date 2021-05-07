resource "aws_s3_bucket" "bucket" {
    // completar los campos para crear el bucket
  // El bucket debe llamarse <nombre de usuario cidenet>-website-host-angular
  // El bucket debe ser privado
  bucket = var.s3.bucket
  acl    = var.s3.acl

  website {
    // completar los campos para que el bucket soporte un website
    index_document = var.s3.website.index_document
    error_document = var.s3.website.error_document
  }
}