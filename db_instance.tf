
module "MYSQL_RDS" {
  source            = "../../modules/"
  db_name           = "Database1"
  user_name         = "master"
  allocated_storage = 10
  security_group_id = [aws_security_group.RDS_MYSQL.id]
}

variable "RDS_port" {
  type    = list(any)
  default = [443, 3306, 80]
}

resource "aws_security_group" "RDS_MYSQL" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"


  dynamic "ingress" {

    for_each = var.RDS_port
    content {

      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "HTTPS"
      cidr_blocks = ["0.0.0.0/24"]

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
