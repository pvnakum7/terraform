terraform{
  required_version = ">= 0.13.5"
  required_providers {
    aws = ">=3.0.0"
  }
  backend "s3" {
    region = "ap-northeast-1"
    profile = "default"
    key     = "terraformstatefile"
    bucket = "my-tf-paras-bucket"
    
  }
}






# resource "aws_s3_bucket" "tf-bucket" {
#   bucket = "my-tf-paras-bucket"
#   acl    = "private"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }
# }