

resource "aws_db_instance" "Test_DB" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  db_name                 = "mydb"
  username             = "admin"
  password             = "Passion@12"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.RDS_MYSQL.id]
}

variable "RDS_port" {
  type = list
  default = [443,3306,80]
}

resource "aws_security_group" "RDS_MYSQL" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
 

dynamic "ingress" {

    for_each = var.RDS_port
  content {
    
    from_port        = ingress.value
    to_port          = ingress.value
    protocol         = "HTTPS"
    cidr_blocks      = ["0.0.0.0/24"]
    
  }
}
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "RDS"
  }
}
