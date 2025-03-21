output "website_url" {
  value = aws_s3_bucket.website.website_endpoint
}
output "db_endpoint" {
  value = aws_db_instance.rds.endpoint
}
