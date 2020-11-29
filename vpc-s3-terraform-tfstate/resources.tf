resource "aws_vpc" "tf_vpc_default"{
    cidr_block = var.vpc_cidr
    instance_tenancy = "default"

  tags = {
    Name = "tf_default"
    Location = "Tokyo-ap-northeast-1"
  }
}

resource "aws_subnet" "subnet1" {

  //here count  length of available zones
 // count = length(var.azs)

 ///this use for any region with availibility zone
    count = length(data.aws_availability_zones.azs.names)
    availability_zone = element(data.aws_availability_zones.azs.names,count.index)

  vpc_id     = aws_vpc.tf_vpc_default.id

  cidr_block = element(var.vpc_subnet_cidr,count.index)
   tags = {
        //Name =   subnetelement(var.subnet_tags,count.index)
        Name =   "subnet-${count.index+1}"
  }
}


