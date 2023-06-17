
resource "aws_instance" "sq-big" {
    
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_id
    vpc_security_group_ids = [ var.def_security_group_id ]
    tags = {
        Name: "Big-Jenkins",
        Project: var.project_name
    }
    
}
