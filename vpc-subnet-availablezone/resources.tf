resource "aws_vpc" "tf_default"{
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"

  tags = {
    Name = "tf_default"
    Location = "Tokyo-ap-northeast-1"
  }
}

resource "aws_subnet" "subnet1" {
  vpc_id     = aws_vpc.tf_default.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Subnet1"
  }
}