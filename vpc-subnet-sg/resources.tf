resource "aws_vpc" "tf_vpc_default" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name     = "tf_default"
    Location = "Tokyo-ap-northeast-1"
  }
}

resource "aws_subnet" "subnet1" {

  //here count  length of available zones
  // count = length(var.azs)

  ///this use for any region with availibility zone
  count             = length(data.aws_availability_zones.azs.names)
  availability_zone = element(data.aws_availability_zones.azs.names, count.index)

  vpc_id = aws_vpc.tf_vpc_default.id

  cidr_block = element(var.vpc_subnet_cidr, count.index)
  tags = {
    //Name =   subnetelement(var.subnet_tags,count.index)
    Name = "subnet-${count.index + 1}"
  }
}


resource "aws_security_group" "sg_webapp" {
  name        = "sg_webapp"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.tf_vpc_default.id


  ingress {
    description = "TLS from VPC"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = [var.sg_http_https]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_webapp"
  }
}