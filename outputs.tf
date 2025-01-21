output "websiteendpoint" {
  value = "http://${aws_s3_bucket.mybucket.bucket}.s3-website-us-east-1.amazonaws.com"
}