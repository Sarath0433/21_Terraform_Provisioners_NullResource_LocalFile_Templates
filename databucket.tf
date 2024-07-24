resource "aws_s3_bucket" "devopsb29bucket001" {
  bucket = "devopsb29bucket001abc"

  tags = {
    Name        = "devopsb29bucket001abc"
    Environment = "Dev"
  }
  lifecycle {
    create_before_destroy = true
  }
}
resource "aws_s3_bucket" "devopsb29bucket002" {
  bucket = "devopsb29bucket002abc"

  tags = {
    Name        = "devopsb29bucket002abc"
    Environment = "Dev"
  }
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_s3_bucket" "devopsb29bucket003" {
  bucket = "devopsb29bucket003abc"

  tags = {
    Name        = "devopsb29bucket003abc"
    Environment = "Dev"
  }
  lifecycle {
    create_before_destroy = true
  }
}