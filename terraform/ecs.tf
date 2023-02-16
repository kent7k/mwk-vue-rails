/* Defenition of Cluster */
resource "aws_ecs_cluster" "meetwithkids-ecs-cluster" {
  name = "meetwithkids-ecs-cluster"
}

/* Frontend: TaskDefinition */
resource "aws_ecs_task_definition" "meetwithkids-frontend-task" {
  family                   = "meetwithkids-frontend-task"
  cpu                      = "512"
  memory                   = "1024"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./tasks/meetwithkids_frontend_definition.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}
/* Backend: TaskDefinition */
resource "aws_ecs_task_definition" "meetwithkids-backend-task" {
  family                   = "meetwithkids-backend-task"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  container_definitions    = file("./tasks/meetwithkids_backend_definition.json")
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* Backend: ServiceDefenition */
resource "aws_ecs_service" "meetwithkids-backend-ecs-service" {
  name                              = "meetwithkids-backend-ecs-service"
  cluster                           = aws_ecs_cluster.meetwithkids-ecs-cluster.arn
  task_definition = "${ aws_ecs_task_definition.meetwithkids-backend-task.family }:${ max(aws_ecs_task_definition.meetwithkids-backend-task.revision, data.aws_ecs_task_definition.meetwithkids-backend-task.revision) }" 
#  this & that
#  task_definition = "${aws_ecs_task_definition.this[each.key].family}:${max(aws_ecs_task_definition.this[each.key].revision, data.aws_ecs_task_definition.this[each.key].revision)}"
#  task_definition                   = "${aws_ecs_task_definition.meetwithkids-backend-task.family}:${max("${aws_ecs_task_definition.meetwithkids-backend-task.revision}", "${data.aws_ecs_task_definition.meetwithkids-backend-task.revision}")}"
#  https://hashicorp6.rssing.com/chan-74714669/all_p54.html
  desired_count                     = 1
  launch_type                       = "FARGATE"
  platform_version                  = "1.3.0"
  health_check_grace_period_seconds = 600

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.meetwithkids-ecs-sg.id
    ]
    subnets = [
      aws_subnet.meetwithkids-back-1a.id,
      aws_subnet.meetwithkids-back-1c.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.meetwithkids-backend-alb-tg.arn
    container_name   = "backend-container"
    container_port   = "3000"
  }
}
/* Frondend: ServiceDefenition */
resource "aws_ecs_service" "meetwithkids-frontend-ecs-service" {
  name                              = "meetwithkids-frontend-ecs-service"
  cluster                           = aws_ecs_cluster.meetwithkids-ecs-cluster.arn
  task_definition = "${ aws_ecs_task_definition.meetwithkids-frontend-task.family }:${ max(aws_ecs_task_definition.meetwithkids-frontend-task.revision, data.aws_ecs_task_definition.meetwithkids-frontend-task.revision) }" 
  desired_count                     = 1
  launch_type                       = "FARGATE"
  platform_version                  = "1.3.0"
  health_check_grace_period_seconds = 600

  network_configuration {
    assign_public_ip = true
    security_groups = [
      aws_security_group.meetwithkids-ecs-sg.id
    ]
    subnets = [
      aws_subnet.meetwithkids-front-1a.id,
      aws_subnet.meetwithkids-front-1c.id
    ]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.meetwithkids-frontend-alb-tg.arn
    container_name   = "frontend-container"
    container_port   = "80"
  }
}

/* Tasks for Create */
resource "aws_ecs_task_definition" "db-create" {
  family                   = "meetwithkids-db-create"
  container_definitions    = file("./tasks/meetwithkids_db_create_definition.json")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* Tasks for Migration */
resource "aws_ecs_task_definition" "db-migrate" {
  family                   = "meetwithkids-db-migrate"
  container_definitions    = file("./tasks/meetwithkids_db_migrate_definition.json")
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
}

/* Task for Seeds */
resource "aws_ecs_task_definition" "db-seed" {
    family                   = "meetwithkids-db-seed"
    container_definitions    = file("./tasks/meetwithkids_db_seed_definition.json")
    requires_compatibilities = ["FARGATE"]
    network_mode             = "awsvpc"
    cpu                      = "256"
    memory                   = "512"
    execution_role_arn       = module.ecs_task_execution_role.iam_role_arn
  }

/* data */
data "aws_ecs_task_definition" "meetwithkids-frontend-task" {
  depends_on      = [aws_ecs_task_definition.meetwithkids-frontend-task]
  task_definition = aws_ecs_task_definition.meetwithkids-frontend-task.family
}

data "aws_ecs_task_definition" "meetwithkids-backend-task" {
  depends_on      = [aws_ecs_task_definition.meetwithkids-backend-task]
  task_definition = aws_ecs_task_definition.meetwithkids-backend-task.family
}

data "aws_iam_policy" "ecs_task_execution_role_policy" {
  arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy_document" "ecs_task_execution" {
  source_json = data.aws_iam_policy.ecs_task_execution_role_policy.policy

  statement {
    effect    = "Allow"
    actions   = ["ssm:GetParameters", "kms:Decrypt"]
    resources = ["*"]
  }
}

/* IAM Role */
module "ecs_task_execution_role" {
  source     = "./iam_role"
  name       = "ecs-task-execution"
  identifier = "ecs-tasks.amazonaws.com"
  policy     = data.aws_iam_policy_document.ecs_task_execution.json
}
