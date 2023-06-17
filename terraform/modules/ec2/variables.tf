variable "project_name" {
    description = "Project name"
    type = string
}

variable "ami_id" {
    description = "AMI ID"
    type = string
}

variable "instance_type" {
    description = "instance type"
    type = string
}

variable "key_id" {
    description = "The keypair id"
    type = string
}

variable "def_security_group_id" {
    description = "Security group for the instance to connect to"
}
