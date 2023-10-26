resource "aws_db_instance" "main" {
  identifier             = local.db
  db_name                = "nuumfactorydb${var.digit}"
  allocated_storage      = 10
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  db_subnet_group_name   = "nuumfactory-db-subnet-group"
  vpc_security_group_ids = [aws_security_group.Yacine-security-group-for-DB.id]
  username               = "dbadmin"
  password               = "dbpassword"
  #parameter_group_name = "default.mysql5.7"
  skip_final_snapshot = true
}