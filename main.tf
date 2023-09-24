resource "aws_s3_bucket" "my-new-S3-bucket" {
  bucket = "my-new-tf-test-bucket-veerasek"
  tags = {
    Name    = "My S3 Bucket"
    Purpose = "Intro to Resource Blocks Lab"
  }
}
resource "aws_s3_bucket" "my-new-S3-bucket1" {
  bucket = "my-new-tf-test-bucket-veerasek1"
  tags = {
    Name    = "My S3 Bucket"
    Purpose = "Intro to Resource Blocks Lab"
  }
}


