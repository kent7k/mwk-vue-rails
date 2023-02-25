resource "aws_cloudwatch_log_group" "meetwithkids-ecs-back" {
  name              = "/ecs/backend"
  retention_in_days = 180
}
resource "aws_cloudwatch_log_group" "meetwithkids-ecs-front" {
  name              = "/ecs/frontend"
  retention_in_days = 180
}
resource "aws_cloudwatch_log_group" "meetwithkids-ecs-db-create" {
  name              = "/ecs/db-create"
  retention_in_days = 180
}
resource "aws_cloudwatch_log_group" "meetwithkids-ecs-db-migrate" {
  name              = "/ecs/db-migrate"
  retention_in_days = 180
}
resource "aws_cloudwatch_log_group" "meetwithkids-ecs-db-seed" {
  name              = "/ecs/db-seed"
  retention_in_days = 180
}
resource "aws_cloudwatch_log_group" "meetwithkids-ecs-db-prepare" {
  name              = "/ecs/db-prepare"
  retention_in_days = 180
}
resource "aws_cloudwatch_log_group" "fluentbit" {
  name = "/fargate/containers/fluentbit"
}
# resource "aws_cloudwatch_log_group" "meetwithkids-ecs-firelens-back" {
#   name              = "/ecs/firelens/backend"
#   retention_in_days = 180
# }
# resource "aws_cloudwatch_log_group" "meetwithkids-ecs-firelens-front" {
#   name              = "/ecs/firelens/frontend"
#   retention_in_days = 180
# }