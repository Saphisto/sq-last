variable "project_name" {
  description = "Project name"
  type = string
}

variable "key_name" {
  description = "The name for the ssh key-pair.(Will be created in AWS)"
  type = string
}

variable "public_key_path" {
  description = "The file path for the public key to import."
  type = string
}


