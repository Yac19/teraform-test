###########################--SECURITY GROUP FOR ELB--###########################

resource "aws_security_group" "Yacine-security-group-for-LB" {
  name   = "nuumfactory-${var.environment}-elb-sg-${var.digit}"
  vpc_id = var.vpc

  # Autorisation des flux HTTP depuis n’importe quelle source
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # 0.0.0.0/0 désigne toutes les IP d'internet
  }

  # Autorisation de tous les flux vers n’importe quelle destination
  egress {
    from_port   = 0    # 0 signifie tous les ports
    to_port     = 0    # 0 signifie tous les ports
    protocol    = "-1" # -1 signifie tous les protocoles
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nuumfactory-${var.environment}-elb-sg-${var.digit}"
  }
}

########################--SECURITY GROUP FOR WEBSERVER--##################################

resource "aws_security_group" "Yacine-security-group-for-WebServer" {
  name   = "nuumfactory-${var.environment}-ec2-sg-${var.digit}"
  vpc_id = var.vpc

  # Autorisation des flux HTTP depuis un autre security group
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.Yacine-security-group-for-LB.id]
  }

  # Autorisation des flux SSH depuis une adresse IP spécifique
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["37.65.46.129/32", "5.50.34.152/32"]
  }

  # Autorisation de tous les flux vers n’importe quelle destination
  egress {
    from_port   = 0    # 0 signifie tous les ports
    to_port     = 0    # 0 signifie tous les ports
    protocol    = "-1" # -1 signifie tous les protocoles
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nuumfactory-${var.environment}-ec2-sg-${var.digit}"
  }
}

###########################--SECURITY GROUP FOR DB--#################################

resource "aws_security_group" "Yacine-security-group-for-DB" {
  name   = "nuumfactory-${var.environment}-db-sg-${var.digit}"
  vpc_id = var.vpc

  # Autorisation des flux HTTP depuis un autre security group
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.Yacine-security-group-for-WebServer.id]
  }

  # Autorisation de tous les flux vers n’importe quelle destination
  egress {
    from_port   = 0    # 0 signifie tous les ports
    to_port     = 0    # 0 signifie tous les ports
    protocol    = "-1" # -1 signifie tous les protocoles
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "nuumfactory-${var.environment}-db-sg-${var.digit}"
  }
}