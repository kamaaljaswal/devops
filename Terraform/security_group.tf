resource "aws_default_vpc" "default" {}

resource "aws_security_group" "dev" {
  name = "Dev security group"
  description = "Dev security group - Managed by Terraform"
  
  vpc_id = aws_default_vpc.default.id

  tags = {
    Name = "dev"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  for_each = local.dev_ports
  security_group_id = aws_security_group.dev.id
  description = each.key
  cidr_ipv4 = each.value.ip
  from_port = each.value.port
  ip_protocol = "tcp"
  to_port = each.value.port
}

resource "aws_vpc_security_group_egress_rule" "allow_all_outbound" {
  security_group_id = aws_security_group.dev.id
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1" 
}