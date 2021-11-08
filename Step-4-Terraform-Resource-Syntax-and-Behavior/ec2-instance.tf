
resource "aws_instance" "myweb" {
    ami                 =   "ami-03a80f322a6053f85" # Us-east-1 ubuntu 20.04 Image id
    instance_type       =   "t2.micro"
    availability_zone   =   "us-east-1a"

    tags    =   {
        Name        =   "mywebapp"
        Enviroment  =   "dev"
        
    }





}