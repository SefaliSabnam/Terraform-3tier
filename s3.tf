resource "aws_s3_bucket" "website" {
  bucket = "gaming-platform-${random_string.suffix.result}"
  acl    = "public-read"
  website {
    index_document = "index.html"
  }
}

resource "aws_s3_bucket_object" "html" {
  bucket = aws_s3_bucket.website.id
  key    = "index.html"
  source = "index.html"
  content_type = "text/html"
}

resource "random_string" "suffix" {
  length  = 6
  special = false
  upper   = false
}
