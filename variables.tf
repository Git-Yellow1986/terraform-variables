variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"

}

variable "tags" {
  type = map(any) # optional
  default = {
    Name        = "Backend"
    Project     = "Expense"
    Component   = "Backend"
    Environment = "Dev"
    Terraform   = "true"
  }
}

variable "sg_name" {
  default = "Allow all SSH_22 "
}

variable "sg_description" {
  default = "Allow inbound trafic and all outbound traffic"
}

variable "port_no" {
  type    = number
  default = 22
}
variable "protocal" {
  default = "tcp"
}

variable "cidr_ingress" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}
variable "ipv6_ingress" {
  type    = list(string)
  default = ["::/0"]
}

variable "sg_tags" {

  default = "Sg_for_ec2"
}
