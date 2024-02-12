resource "aws_instance" "staging" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = data.aws_key_pair.osama.key_name

  tags = {
    Name = "Staging"
    Environment = "Staging"
  }

  root_block_device {
    volume_size = "32"
    volume_type = "gp3"
    encrypted = true
  }

  lifecycle {
    ignore_changes = [ ami ]
  }
}