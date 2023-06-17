provider "aws" {
  region = "us-west-2"
}

module "sec_group" {
  source = "./modules/security_group"
  vpc_id = data.aws_vpc.default.id
  project_name = var.project_name
}


module "ec2" {
  source = "./modules/ec2"
  project_name = var.project_name
  ami_id = var.ami_id
  def_security_group_id = module.sec_group.security_group_id
  instance_type = var.instance_type
  key_id = module.keypair.key_pair_id
}

module "keypair" {
  source = "./modules/keypair"
  project_name = var.project_name
  key_name = var.key_name
  public_key_path = file("./ssh-key/sq-session.pub")
}

module "host_file" {
  source = "./modules/local_file"
  instances = module.ec2.public_ip
  template_file = var.template_file
  inventory_path = var.inventory_path  
}

