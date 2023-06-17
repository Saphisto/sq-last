output "public_ip" {
  value = aws_instance.sq-big.public_ip
}

output "instance_ids" {
  value = aws_instance.sq-big[*].id
}

output "ec2_instances" {
  value = aws_instance.sq-big
}
