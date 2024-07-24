terraform {
  backend "s3" {
    bucket = "devopsb29remotestate"
    key    = "meta-args.tfstate"
    region = "us-east-1"
  }
}
