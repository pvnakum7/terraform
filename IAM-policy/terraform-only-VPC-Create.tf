resource "aws_vpc" "tf-vpc-master" {
  provider             = aws.region-master
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "Tf-Master-VPC"
  }
}

resource "aws_vpc" "tf-vpc-worker" {
  provider             = aws.region-worker
  cidr_block           = "192.168.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "Tf-Worker-VPC"
  }
}
