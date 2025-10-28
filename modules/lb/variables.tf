
variable "app_name" {
  type    = string
  default = "serverless-ecs"
}


variable "public_subnets" {
  description = "public subnet"
  type = list(string)
}

variable "sg_id" {
    type = string
  
}