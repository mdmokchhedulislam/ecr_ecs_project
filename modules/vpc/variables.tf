variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "ecs_desired_count" {
  default = 2
}

variable "ecs_max_count" {
  default = 5
}

variable "ecs_min_count" {
  default = 2
}

variable "container_image" {
  default = "yourdockerhub/app:latest"
}

variable "container_port" {
  default = 80
}
