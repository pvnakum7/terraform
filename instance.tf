provider "aws"{
  access_key = "my-secret-id"
  secret_key = "my--secret-key"
  region = "us-east-1"
}

resource "aws_instance" "tf-instance demo" {
  ami = "ami-81e2a0f0"
  instance-type = "t2.micro"
 
}
