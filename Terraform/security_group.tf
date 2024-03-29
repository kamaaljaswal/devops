resource "aws_default_vpc" "default" {}

module "dev_security_group" {
  source = "./modules/security_group"
  name = "Dev"
  inbound_ips_and_ports = local.dev_ports
  vpc_id = aws_default_vpc.default.id
}

module "admin_security_group" {
  source = "./modules/security_group"
  name = "Admin"
  inbound_ips_and_ports = local.admin_ports
  vpc_id = aws_default_vpc.default.id
}