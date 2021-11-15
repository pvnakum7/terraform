variable "AWS_REGION" {
  default = "us-west-1"
}

variable "PRIVATE_KEY_PATH" {
  //default = "/Users/imagine/Music/Myproject/northc-test.pem"
    default = "northc-test"
}

variable "PUBLIC_KEY_PATH" {
  default = "/Users/imagine/Music/Myproject/Paras.pub"
}

variable "EC2_USER" {
  default = "ubuntu"
}
variable "AMI" {
  type    = string
  default = "ami-053ac55bdcfe96e85"

}
# variable "AMI" {
#   type = map(any)
#   default = {
#     us-west-1 = "ami-053ac55bdcfe96e85"
#     us-east-1 = "ami-083654bd07b5da81d"
#   }
# }

# EXISTING RESOURCES
# variable "subnet_id" {}
# variable "vpc_id" {} # 
