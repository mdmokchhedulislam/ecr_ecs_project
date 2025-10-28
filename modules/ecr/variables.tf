variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "app_name" {
  type    = string
  default = "serverless_ecs"
}

variable "desired_count" {
  type    = number
  default = 2
}

variable "min_count" {
  type    = number
  default = 1
}

variable "max_count" {
  type    = number
  default = 4
}


variable "public_subnets" {
  description = "public subnet"
  type = list(string)
}

# variable "private_subnets" {
#   description = "public subnet"
#   type = list(string)
# }

variable "vpc_id" {
    type = string
  
}