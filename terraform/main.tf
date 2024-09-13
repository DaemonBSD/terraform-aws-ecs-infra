# Criação do cluster ECS
resource "aws_ecs_cluster" "main" {
  name = "${var.project_name}-${var.environment}-cluster"
  # O nome do cluster é composto pelo nome do projeto e ambiente para fácil identificação
}

# Grupo de logs do CloudWatch para os containers ECS
resource "aws_cloudwatch_log_group" "ecs_logs" {
  name = "/ecs/${var.project_name}-${var.environment}-task-definition"
  # Os logs são agrupados por projeto e ambiente
}

# Definição da tarefa ECS
resource "aws_ecs_task_definition" "main" {
  family                   = "${var.project_name}-${var.environment}-task-definition"
  network_mode             = "awsvpc"  # Usa o modo de rede awsvpc, necessário para Fargate
  requires_compatibilities = ["FARGATE"]  # Especifica o uso do Fargate
  cpu                      = var.cpu    # Define a quantidade de CPU para a tarefa
  memory                   = var.memory # Define a quantidade de memória para a tarefa
  execution_role_arn       = aws_iam_role.ecs_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_role.arn

  # Definição do container
  container_definitions = jsonencode([
    {
      name  = "${var.project_name}-${var.environment}-container"
      image = var.docker_image_name
      essential = true
      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]
      # Configuração para carregar variáveis de ambiente de um arquivo no S3
      environmentFiles = [
        {
          value = var.s3_env_vars_file_arn
          type  = "s3"
        }
      ]
      # Configuração de logs
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.ecs_logs.name
          "awslogs-region"        = var.aws_region
          "awslogs-stream-prefix" = "ecs"
        }
      }
    }
  ])
}

# Serviço ECS
resource "aws_ecs_service" "main" {
  name            = "${var.project_name}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.main.arn
  desired_count   = var.app_count  # Número de instâncias da tarefa a serem executadas
  launch_type     = "FARGATE"

  # Configuração de rede para o serviço
  network_configuration {
    security_groups = [aws_security_group.ecs_tasks.id]
    subnets         = module.vpc.private_subnets
  }

  # Configuração do load balancer
  load_balancer {
    target_group_arn = aws_lb_target_group.main.arn
    container_name   = "${var.project_name}-${var.environment}-container"
    container_port   = var.container_port
  }

  depends_on = [aws_lb_listener.main]
}

# Application Load Balancer
resource "aws_lb" "main" {
  name               = "${var.project_name}-${var.environment}-alb"
  internal           = false  # ALB público
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets            = module.vpc.public_subnets
}

# Target Group para o ALB
resource "aws_lb_target_group" "main" {
  name        = "${var.project_name}-${var.environment}-tg"
  port        = var.container_port
  protocol    = "HTTP"
  vpc_id      = module.vpc.vpc_id
  target_type = "ip"  # Necessário para Fargate

  health_check {
    path                = var.health_check_path
    protocol            = "HTTP"
    matcher             = "200-299"  # Códigos de sucesso HTTP
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
  }
}

# Listener para o ALB
resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

# IAM Role para execução de tarefas ECS
resource "aws_iam_role" "ecs_execution_role" {
  name = "${var.project_name}-${var.environment}-ecs-execution-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

# Anexando política de execução de tarefas ECS
resource "aws_iam_role_policy_attachment" "ecs_execution_role_policy" {
  role       = aws_iam_role.ecs_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

# IAM Role para tarefas ECS
resource "aws_iam_role" "ecs_task_role" {
  name = "${var.project_name}-${var.environment}-ecs-task-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      }
    ]
  })
}

# Adicione políticas IAM adicionais para a role da tarefa conforme necessário