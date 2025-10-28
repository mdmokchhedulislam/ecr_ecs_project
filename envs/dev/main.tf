
module "vpc" {
    source = "../../modules/vpc" 
}



module "ecs" {
    source = "../../modules/ecr"
    vpc_id = module.vpc.vpc_id
    sg_id = module.security_groups.ecs_sg_id
    public_subnets = module.vpc.public_subnets
    alb_target_group_arn = module.lb.aws_lb_target_group_arn
    lb_listener_arn = module.lb.lb_listener_arn
  
}


module "security_groups" {
    source = "../../modules/security"
    vpc_id = module.vpc.vpc_id
  
}

module "lb" {
    source = "../../modules/lb"
    vpc_id = module.vpc.vpc_id
    sg_id = module.security_groups.lb_sg_id
    public_subnets = module.vpc.public_subnets
   
  
}