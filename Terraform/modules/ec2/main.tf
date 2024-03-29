resource "aws_instance" "main" {
  ami = data.aws_ami.ubuntu.id
  key_name = var.key_name
  instance_type = var.instance_type

  root_block_device {
    volume_size = var.root_volume_gb
    volume_type = "gp3"
    encrypted = true
  }

  vpc_security_group_ids = var.security_group_ids_list

  tags = {
    "Name": var.name
  }

  lifecycle {
    ignore_changes = [ ami ]
  }
}

resource "aws_eip" "main" {
  count = var.elastic_ip == true ? 1 : 0
  domain = "vpc"
  instance = aws_instance.main.id

  tags = {
    "Name": "${var.name} IP"
  }
}