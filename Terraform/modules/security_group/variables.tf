variable "name" {
  type = string
  description = "Name of the security group"
}

variable "vpc_id" {
  type = string
  description = "ID of the security group's VPC"
}

variable "inbound_ips_and_ports" {
  type = object({
    name = object({
      ip = string
      port = number 
    })
  })
  description = "List of IPs and Ports for inbound traffic"
}