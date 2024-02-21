variable "name" {
  type = string
  description = "Name of the EC2 instance"
}

variable "key_name" {
  type = string
  description = "Name of the key to use for ssh access."
}

variable "instance_type" {
  type = string
  description = "Type of the EC2 instance"
  default = "t2.micro"
}

variable "root_volume_gb" {
  type = number
  description = "Size of the root volume in GBs"
  default = 8
}

variable "security_group_ids_list" {
  type = list(string)
  description = "List of security group to attach to instance"
}

variable "elastic_ip" {
  type = bool
  description = "Attach elastic ip to instance if true"
  default = false
}