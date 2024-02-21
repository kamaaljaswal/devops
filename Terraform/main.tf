module "staging" {
  source = "./modules/ec2"
  name = "Staging"
  key_name = data.aws_key_pair.osama.key_name
  instance_type = "t2.micro"
  root_volume_gb = 32
  security_group_ids_list = [aws_security_group.dev.id]
  elastic_ip = true
}

module "jenkins" {
  source = "./modules/ec2"
  name = "Jenkins"
  key_name = data.aws_key_pair.osama.key_name
  instance_type = "t2.micro"
  root_volume_gb = 32
  security_group_ids_list = [aws_security_group.admin.id]
  elastic_ip = true
}