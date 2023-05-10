resource "aws_db_instance" "rds_mysql" {
  identifier             = var.identifier
  engine                 = "mysql"
  engine_version         = var.engine_version
  instance_class         = var.instance_type
  allocated_storage      = var.storage_size
  name                   = var.db_name
  username               = var.username
  password               = var.password
  port                   = var.port
  storage_type           = "gp2"
  multi_az               = var.multi_az
  publicly_accessible    = var.publicly_accessible
  # vpc_security_group_ids = var.security_group_ids
}
