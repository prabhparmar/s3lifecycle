resource "aws_s3_bucket" "lifecycle-prabh1" {
  bucket = "lifecycle-prabh1"
  acl    = "private"
  lifecycle_rule {
  
    id      = "archive"
    enabled = true

    prefix = "archive/"

    # tags {
    #   rule = "archive"
    # }

    transition {
      days          = 1
      storage_class = "GLACIER"
    }

    expiration {
      days = 2
    }
  }


}


resource "aws_s3_bucket_object" "lifecycle-prabh1-archive" {
  bucket = "${aws_s3_bucket.lifecycle-prabh1.id}"
  acl    = "private"
  key    = "archive/"
  source = "/dev/null"
}

  
