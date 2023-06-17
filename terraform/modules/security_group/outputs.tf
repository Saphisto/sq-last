output "security_group_id" {
  value = aws_security_group.security_group_az.id
}

output "security_group_arn" {
  value = aws_security_group.security_group_az.arn
}