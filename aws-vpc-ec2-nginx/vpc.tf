# resource "aws_vpc" "prod-vpc" {
#   cidr_block           = "172.31.0.0/16"
#   enable_dns_support   = "true"
#   enable_dns_hostnames = "true"
#   enable_classiclink   = "false"
#   instance_tenancy     = "default"

#   tags = {
#     Name = "prod-vpc"
#   }
# }

# resource "aws_subnet" "prod-subnet-public-1" {
#   vpc_id                  = var.vpc_id
# #   vpc_id                 = aws_vpc.prod-vpc.id
#   cidr_block              = "172.31.0.0/20"
#   map_public_ip_on_launch = "true" //it makes this a public subnet
#   availability_zone       = "us-east-1a"

#   tags = {
#     Name = "prod-subnet-public-1"
#   }
# }