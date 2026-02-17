resource "tls_private_key" "key_pair" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "webserver_kp" {
    key_name = "webserver-kp"
    public_key = tls_private_key.key_pair.public_key_openssh
  
}

resource "local_file" "private_key" {
    content = tls_private_key.key_pair.private_key_pem
    filename = "<file_path>"
    file_permission = "0400"
  
}

resource "aws_instance" "webserver" {
  ami = var.ami
  subnet_id = var.subnet_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  root_block_device {
    volume_size = 8
  }
  user_data = <<-EOF
  #!/bin/bash
  sudo apt update -y
  sudo apt install nginx -y
  sudo systemctl enable --now nginx
  EOF
  key_name = aws_key_pair.webserver_kp.key_name
}

output "public_ip" {
  value = aws_instance.webserver.public_ip
}