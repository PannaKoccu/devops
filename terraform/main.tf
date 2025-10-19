provider "aws" {
  region = var.region
}

data "aws_ami" "pet_proekt" {
    owners = ["099720109477"]
    most_recent = true
    filter {
        name = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd-server-*"]
    }
     filter {
        name = "virtualization-type"
        values = ["hvm"]
     }
  
}


 resource "aws_instance" "web" {
    ami = data.aws.pet_proekt.id
    instance_type = "t3.micro"
    tags = {
      Name = "devops_server"
      Owner = "pannakoccu"
    }
    vpc_security_group_ids = [aws_security_group.my_progect.id]
    key_name               = aws_key_pair.deployer.key_name
    lifecycle {
      prevent_destroy = true
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
            for_each = ["80" , "22" , "3000" , "9090"]
            content {
            from_port =80
            to_port   =80
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