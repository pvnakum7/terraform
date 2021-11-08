variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PRIVATE_KEY_PATH" {
  default = "/Users/imagine/Music/Myproject/Paras.pem"
}

variable "PUBLIC_KEY_PATH" {
  default = "/Users/imagine/Music/Myproject/Paras.pub"
}

variable "EC2_USER" {
  default = "ubuntu"
}
variable "AMI" {
  type = map(any)
  default = {
    eu-west-2 = "ami-03dea29b0216a1e03"
    us-east-1 = "ami-083654bd07b5da81d"
  }
}

# EXISTING RESOURCES
variable "subnet_id" {}
variable "vpc_id" {} # 
