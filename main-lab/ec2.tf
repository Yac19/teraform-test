resource "aws_instance" "Yac-instance" {
  ami                         = var.ami
  instance_type               = var.ec2_type
  subnet_id                   = data.aws_subnet.public-subnet-1.id
  vpc_security_group_ids      = [aws_security_group.Yacine-security-group-for-WebServer.id]
  associate_public_ip_address = true
  key_name                    = "nuumfactory-ec2-key-pair"

  tags = {
    Name = local.ec2_name
  }

  user_data = file("user_data.sh")
}


