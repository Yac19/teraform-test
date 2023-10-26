output "aws_lb" {
  description = "output de mon Load-Balancer"
  value       = aws_lb.Yac-LB.name
}

output "load_balancer_dns_name" {
  description = "output de mon "
  value       = aws_lb.Yac-LB.dns_name
}

output "SG_LB" {
  value = aws_security_group.Yacine-security-group-for-DB.name
}

output "ec2_name" {
  value = local.ec2_name
  #value = aws_instance.Yac-instance.tags_all
}

output "public_address_IP_ec2" {
  value = aws_instance.Yac-instance.public_ip
}

output "private_address_IP_ec2" {
  value = aws_instance.Yac-instance.private_ip
}

output "SG-ec2" {
  value = aws_security_group.Yacine-security-group-for-WebServer.name
}

output "db_name" {
  value = aws_db_instance.main.db_name
}

output "endpoint_db" {
  value = aws_db_instance.main.endpoint
}

output "db_port" {
  value = aws_db_instance.main.port
}

output "SG-db" {
  value = aws_security_group.Yacine-security-group-for-DB.name
}

