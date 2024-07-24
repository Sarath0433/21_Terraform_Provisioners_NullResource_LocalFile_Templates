resource "aws_instance" "web-1" {
  ami = var.imagename
  #ami = "ami-0d857ff0f5fc4e03b"
  #ami = "${data.aws_ami.my_ami.id}"
  #availability_zone = "us-east-1a"
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = aws_subnet.subnet1-public.id
  vpc_security_group_ids      = ["${aws_security_group.allow_all.id}"]
  associate_public_ip_address = true
  tags = {
    Name       = "Server-1"
    Env        = "Prod"
    Owner      = "Sree"
    CostCenter = "ABCD"
  }
  user_data = <<-EOF
		#!/bin/bash
        sudo apt-get update
		sudo mkdir -p /tmp/test1
        sudo mkdir -p /tmp/test2
        sudo mkdir -p /tmp/test3
	EOF
  # Copies the file as the root user using SSH
  # Copies the file as the Administrator user using WinRM
  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("DeleteLater.pem")
      host        = aws_instance.web-1.public_ip
    }
  }
}