# ecr repo

resource "aws_ecr_repository" "serverless_ecr_repo" {
  name                 = "serverless-repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = {
    Name = "serverless_ecr_repo"
  }
}


resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.app_name}-cluster"
}

resource "aws_ecs_service" "serverless_ecs_service" {
  name            = "${var.app_name}-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.aws_ecs_task_definition.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.public_subnets
    security_groups = [var.sg_id]
    assign_public_ip = true
  }

  # load_balancer {
  #   target_group_arn = var.alb_target_group_arn
  #   container_name   = "${var.app_name}-container"
  #   container_port   = 80
  # }

  # depends_on = [var.lb_listener_arn]
}


resource "aws_ecs_task_definition" "aws_ecs_task_definition" {
  family                   = "${var.app_name}-task"
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn = var.execution_role_arn

  container_definitions = jsonencode([{
    name      = "${var.app_name}-container"
    image     = "${aws_ecr_repository.serverless_ecr_repo.repository_url}:latest"
    cpu       = 256
    memory    = 512
    essential = true
    portMappings = [{
      containerPort = 80
      hostPort      = 80
      protocol      = "tcp"
    }]
    logConfiguration = {
      logDriver = "awslogs"
      options = {
        awslogs-group         = "/ecs/${var.app_name}"
        awslogs-region        = var.aws_region
        awslogs-stream-prefix = "ecs"
      }
    }
  }])
}

