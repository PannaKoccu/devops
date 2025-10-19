provider "aws" {
  region = var.region
}

 resource "aws_instance" "web" {
    ami = "ami-0bbdd8c17ed981ef9"
    instance_type = "t3.micro"
    tags = {
      Name = "devops_server"
      Owner = "pannakoccu"
    }
    vpc_security_group_ids = [aws_security_group.my_progect.id]
    key_name               = aws_key_pair.deployer.key_name
    lifecycle {
      prevent_destroy = false
      ignore_changes = [ ami ]
    }
}
  

resource "aws_key_pair" "deployer" {
  key_name   = "devops-pet-key-autogen"
  public_key = var.public_key
}


 resource "aws_security_group" "my_progect" {
        name = "my_progect_sec_group"
        dynamic "ingress" {
            for_each = ["80" , "22" , "3000" , "9090" , "9115"]
            content {
            from_port = tonumber(ingress.value)
            to_port   = tonumber(ingress.value)
            protocol  ="tcp"
            cidr_blocks = ["0.0.0.0/0"]
            }
        }
        egress {
            from_port =0
            to_port   =0
            protocol  ="-1"
            cidr_blocks = ["0.0.0.0/0"]
        }
    }