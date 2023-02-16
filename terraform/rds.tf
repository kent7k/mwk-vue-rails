/* RDS */
variable "aws_db_user" {}
variable "aws_db_password" {}

resource "aws_db_parameter_group" "meetwithkids-db-parameter" {
  name   = "meetwithkids-db-parameter"
  family = "mysql8.0"

  parameter {
    name  = "character_set_database"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_server"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_client"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_connection"
    value = "utf8mb4"
  }

  parameter {
    name  = "character_set_results"
    value = "utf8mb4"
  }
}

/* Database Instance */
resource "aws_db_instance" "meetwithkids-db" {
  # identifier              = Endpoint of Database"
  allocated_storage                 = 20
  instance_class                    = "db.t2.micro"
  engine                            = "MySQL"
  engine_version                    = "8.0.28"
  storage_type                      = "gp2"
  db_name                           = "production"
  username                          = var.aws_db_user
  password                          = var.aws_db_password
  backup_retention_period           = 7
  copy_tags_to_snapshot             = true
  max_allocated_storage             = 200
  skip_final_snapshot               = true
  port                              = 3306
  vpc_security_group_ids            = [
    aws_security_group.meetwithkids-rds-sg.id
  ]
  parameter_group_name            = aws_db_parameter_group.meetwithkids-db-parameter.name
  db_subnet_group_name            = aws_db_subnet_group.meetwithkids-rds-subnet-group.name
  enabled_cloudwatch_logs_exports = [
    "audit",
    "error",
    "general",
    "slowquery",
  ]
  publicly_accessible = true

  lifecycle {
    prevent_destroy = false
  }

}


/* Subnet */
resource "aws_db_subnet_group" "meetwithkids-rds-subnet-group" {
  name        = "meetwithkids-rds-subnet-group"
  description = "RDS subnet for meetwithkids"
  subnet_ids  = [aws_subnet.meetwithkids-back-1a.id, aws_subnet.meetwithkids-back-1c.id]
}
