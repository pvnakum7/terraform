# terraform-vpc
Terraform, Infrastructure as Code! 



It creates; 
* 1 VPC, 
* 1 public subnet, 
* 1 Internet Gateway, 
* 1 Security Group
* 1 EC2 (installed a nginx in it)

After cloning the repo, just run these 3 commands

```
ssh-keygen -f london-region-key-pair
terraform init
terraform plan -out terraform.out
terraform apply terraform.out
```





Note terraform.tfvars

appname = "demo-nginx" # Change to your nginxname
prefix = "development"
profile = "default" # Change to your key
region = "us-east-1"

subnet_id = "subnet-0065b31-id" # I should create it's own subnet but... Just copy this from your other instance
vpc_id = "vpc-0afd4e-id # I should also create its own vpc... Just copy from existing

identity_location = "/Users/imagine/Music/Myproject/Paras.pem" # Change to your key location

ec2_ami_id = "ami-083654bd07b5da81d"
ec2_instance_size = "t2.micro"
ec2_instance_count = 1


















































https://medium.com/@aliatakan/terraform-create-a-vpc-subnets-and-more-6ef43f0bf4c1