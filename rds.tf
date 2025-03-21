resource "aws_db_instance" "rds" {
  allocated_storage = 20
  engine = "mysql"
  engine_version = "8.0"
  instance_class = var.db_instance_type
  username = var.db_username
  password = var.db_password
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.web_sg.id]
  tags = { Name = "rds-db" }
}
