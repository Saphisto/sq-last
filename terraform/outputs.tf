output "main_out" {
  value = module.host_file.local_output
}

output "ec2s" {
  value = module.ec2.public_ip
}

output "vpc_id" {
  value = data.aws_vpc.default.id
}
