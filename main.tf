#create s3 bucket
resource "aws_s3_bucket" "mybucket" {
  bucket = var.bucketname
}

resource "aws_s3_bucket_ownership_controls" "tf_project_bucket" {
  bucket = aws_s3_bucket.mybucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "tf_project_bucket" {
  bucket = aws_s3_bucket.mybucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "tf_project_bucket" {
  depends_on = [
    aws_s3_bucket_ownership_controls.tf_project_bucket,
    aws_s3_bucket_public_access_block.tf_project_bucket,
  ]

  bucket = aws_s3_bucket.mybucket.id
  acl    = "public-read"
}

resource "aws_s3_object" "applight_files" {
  for_each = fileset(var.folder_name, "**/*")

  bucket       = aws_s3_bucket.mybucket.id
  key          = each.value
  source       = "${var.folder_name}/${each.value}"
  acl          = "public-read"
  content_type = lookup(
    {
      "html"  = "text/html"
      "css"   = "text/css"
      "js"    = "application/javascript"
      "png"   = "image/png"
      "jpg"   = "image/jpeg"
      "jpeg"  = "image/jpeg"
      "txt"   = "text/plain"
    },
    split(".", each.value)[length(split(".", each.value)) - 1],
    "application/octet-stream"
  )
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.mybucket.id
  index_document {
    suffix = "index.html"
  }

  depends_on = [ aws_s3_bucket_acl.tf_project_bucket ]
}