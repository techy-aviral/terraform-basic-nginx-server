variable "instance_type" {
  type = string
  default = "t3.micro"
}

variable "ami" {
  type = string
  default = "ami-09bef70fd0768fd0d"
}

variable "subnet_id" {
  type = string
  
}
variable "vpc_security_group_ids" {
  type = list(string)
}