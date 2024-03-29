module "staging" {
  source = "./modules/ec2"
  name = "Staging"
  key_name = data.aws_key_pair.osama.key_name
  instance_type = "t2.micro"
  root_volume_gb = 32
  security_group_ids_list = [module.dev_security_group.security_group_id]
  elastic_ip = true
}

module "jenkins" {
  source = "./modules/ec2"
  name = "Jenkins"
  key_name = data.aws_key_pair.osama.key_name
  instance_type = "t2.micro"
  root_volume_gb = 32
  security_group_ids_list = [module.admin_security_group.security_group_id]
  elastic_ip = true
}