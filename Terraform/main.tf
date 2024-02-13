resource "aws_instance" "staging" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = data.aws_key_pair.osama.key_name

  tags = {
    Name = "Staging"
    Environment = "Staging"
  }

  vpc_security_group_ids = [ aws_security_group.dev.id ]

  root_block_device {
    volume_size = "32"
    volume_type = "gp3"
    encrypted = true
  }

  lifecycle {
    ignore_changes = [ ami ]
  }
}

resource "aws_instance" "jenkins" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = data.aws_key_pair.osama.key_name

  root_block_device {
    volume_size = "32"
    volume_type = "gp3"
    encrypted = true
  }

  vpc_security_group_ids = [ aws_security_group.admin.id ]

  tags = {
    "Name": "Jenkins"
  }

  lifecycle {
    ignore_changes = [ ami ]
  }
}