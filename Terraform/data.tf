data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name = "name"
    values = [ "ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*" ]
  }

  owners = [ "amazon" ]
}

data "aws_key_pair" "osama" {
  key_name = "osama"
}