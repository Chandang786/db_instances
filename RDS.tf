resource "aws_db_instance" "Test_DB" {
  allocated_storage      = var.allocated_storage
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  db_name                = var.db_name
  username               = var.user_name
  password               = "Passion@12"
  parameter_group_name   = "default.mysql5.7"
  skip_final_snapshot    = true
  vpc_security_group_ids = var.security_group_id 

}

output "pass" {

    value = aws_db_instance.Test_DB.password
    sensitive = true
}

