resource "local_file" "anislbe_hosts_file" {
  content  = templatefile(var.template_file, { public_ip = var.instances })
  filename = var.inventory_path
}
