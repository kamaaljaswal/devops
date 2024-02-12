resource "aws_instance" "staging" {
  ami = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name = data.aws_key_pair.osama.key_name

  tags = {
    Name = "Staging"
    Environment = "Staging"
  }

  lifecycle {
    ignore_changes = [ ami ]
  }
}