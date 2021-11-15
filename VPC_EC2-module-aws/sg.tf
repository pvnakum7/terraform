module "ec2-security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = ">=3.11.0"
  # insert the 2 required variables here
  //  name        = "${local.prefix}-sg"
  name        = "EC2-SG"
  description = "security group for bastionhost"
  vpc_id      = module.vpc.vpc_id
  egress_with_cidr_blocks = [
    {
      from_port   = "-1"
      to_port     = "-1"
      protocol    = "-1"
      description = "allow outbound to all"
      cidr_blocks = "0.0.0.0/0"
  }, ]
  egress_with_ipv6_cidr_blocks = [
    {
      from_port   = "-1"
      to_port     = "-1"
      protocol    = "-1"
      description = "allow outbound to all"
      cidr_blocks = "::/0"
  }, ]
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "web-sg"
      cidr_blocks = "0.0.0.0/0"
  }, ]

}