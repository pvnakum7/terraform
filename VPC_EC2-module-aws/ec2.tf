module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = "single-instance"

  ami                    = var.AMI
  instance_type          = "t2.large"
  key_name               = var.PRIVATE_KEY_PATH
  monitoring             = true
  vpc_security_group_ids = [module.ec2-security-group.security_group_id]
  subnet_id              = element(module.vpc.public_subnets, 0)
  

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}




