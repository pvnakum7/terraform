resource "aws_key_pair" "us-east-region-key-pair" {
  key_name   = "us-east-region-key-pair"
  public_key = file(var.PUBLIC_KEY_PATH)
}

resource "aws_instance" "web1" {

  ami           = lookup(var.AMI, var.AWS_REGION)
  instance_type = "t2.micro"

  # VPC
#   subnet_id = aws_subnet.prod-subnet-public-1.id
    subnet_id = var.subnet_id

  # Security Group
  vpc_security_group_ids = ["${aws_security_group.ssh-allowed.id}"]

  # the Public SSH key
  key_name = aws_key_pair.us-east-region-key-pair.id

  # nginx installation
  provisioner "file" {
    source      = "config/nginx.conf"
    destination = "/home/ubuntu/test"
    connection {
      user        = "ubuntu"
      private_key = file("${var.PRIVATE_KEY_PATH}")
      host        = self.public_ip
    }
  }
  provisioner "remote-exec" {
    connection {
      user        = "ubuntu"
      private_key = file("${var.PRIVATE_KEY_PATH}")
      host        = self.public_ip
    }

    inline = [
        "sudo apt update",
        "sudo apt install nginx -y",
        "sudo mv /home/ubuntu/test /etc/nginx/sites-available/test",
        "sudo ln -s /etc/nginx/sites-available/test /etc/nginx/sites-enabled/test",
        "sudo rm /etc/nginx/sites-enabled/default",
        "sudo cp /var/www/html/index.nginx-debian.html /var/www/html/index.html",
        "sudo systemctl reload nginx"
    ]
  }

  # provisioner "file" {
  #     source = "nginx.sh"
  #     destination = "/tmp/nginx.sh"
  # }

  # provisioner "remote-exec" {
  #     inline = [
  #         "chmod +x /tmp/nginx.sh",
  #         "sudo /tmp/nginx.sh"
  #     ]
  # }

#   connection {
#     user        = var.EC2_USER
#     private_key = file("${var.PRIVATE_KEY_PATH}")
#   }
}

