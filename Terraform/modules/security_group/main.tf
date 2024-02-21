resource "aws_security_group" "main" {
  name = var.name
  description = "${var.name} security group - Managed by Terraform"

  vpc_id = var.vpc_id

  tags = {
    "Name": var.name
  }
}

resource "aws_vpc_security_group_ingress_rule" "main" {
  for_each = var.inbound_ips_and_ports
  security_group_id = aws_security_group.main
  description = "${each.key} IP"
  to_port = each.value.port
  from_port = each.value.port
  ip_protocol = "tcp"
  cidr_ipv4 = each.value.ip
}

resource "aws_vpc_security_group_egress_rule" "main" {
  security_group_id = aws_security_group.main
  cidr_ipv4 = "0.0.0.0/0"
  ip_protocol = "-1"
}