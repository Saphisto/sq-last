resource "aws_key_pair" "ssh-key" {
    key_name = var.key_name
    public_key = var.public_key_path
    tags = {
        Project: var.project_name
    }
}
