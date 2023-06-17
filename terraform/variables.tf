variable "project_name" {
    type = string
    description = "Project name"
    default = "sq-last-session"
}

variable "ami_id" {
    type = string
    description = "AMI ID"
    default = "ami-0c65adc9a5c1b5d7c"
}

variable "instance_type" {
    type = string
    description = "instance type"
    default = "t3.large"
}

variable "key_name" {
    type = string
    description = "The name for the ssh key-pair.(Will be created in AWS)"
    default = "sq-session"
}


variable "inventory_path" {
    description = "Inventory file path"
    type = string
    default = "../ansible/hosts"
}


variable "template_file" {
    description = "Template file path"
    default = "./modules/local_file/templates/hosts.tpl"
}
