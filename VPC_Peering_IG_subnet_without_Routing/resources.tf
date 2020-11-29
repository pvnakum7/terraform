
#Create VPC in ap-southeast-1
resource "aws_vpc" "vpc_master" {
  provider             = aws.region-master
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "master-vpc-jenkins"
  }
}

#Create VPC in ap-southeast-2
resource "aws_vpc" "vpc_worker_oregon" {
  provider             = aws.region-worker
  cidr_block           = "192.168.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "worker-vpc-jenkins"
  }
}

#Create IGW in ap-southeast-1
resource "aws_internet_gateway" "igw" {
  provider = aws.region-master
  vpc_id   = aws_vpc.vpc_master.id
  tags = {
    Name = "master-igw"
  }
}

#Create IGW in ap-southeast-2
resource "aws_internet_gateway" "igw-oregon" {
  provider = aws.region-worker
  vpc_id   = aws_vpc.vpc_worker_oregon.id
  tags = {
    Name = "worker-igw"
  }
}

#Get all available AZ's in VPC for master region
data "aws_availability_zones" "azs" {
  provider = aws.region-master
  state    = "available"
}


#Create subnet # 1 in ap-southeast-1
resource "aws_subnet" "subnet_1" {
  provider          = aws.region-master
  availability_zone = element(data.aws_availability_zones.azs.names, 0)
  vpc_id            = aws_vpc.vpc_master.id
  cidr_block        = "10.0.1.0/24"
}


#Create subnet #2  in ap-southeast-1
resource "aws_subnet" "subnet_2" {
  provider          = aws.region-master
  vpc_id            = aws_vpc.vpc_master.id
  availability_zone = element(data.aws_availability_zones.azs.names, 1)
  cidr_block        = "10.0.2.0/24"
}


#Create subnet in ap-southeast-2
resource "aws_subnet" "subnet_1_oregon" {
  provider   = aws.region-worker
  vpc_id     = aws_vpc.vpc_worker_oregon.id
  cidr_block = "192.168.1.0/24"
}



######################This part for VPC peering############

#Initiate Peering connection request from ap-southeast-2
resource "aws_vpc_peering_connection" "apeast1-apeast2" {
  //This for source vpc
  provider = aws.region-master
  vpc_id   = aws_vpc.vpc_master.id
  //this for destination vpc
  peer_vpc_id = aws_vpc.vpc_worker_oregon.id
  peer_region = var.region-worker

  tags = {
    Name = "aws_owner_peering"
  }

}

#Accept VPC peering request in ap-southeast-2 from ap-southeast-1
resource "aws_vpc_peering_connection_accepter" "accept_peering" {
  provider                  = aws.region-worker
  vpc_peering_connection_id = aws_vpc_peering_connection.apeast1-apeast2.id
  auto_accept               = true
}

