
module "vpc" {
    source = "../../modules/vpc" 
}



module "ecs" {
    source = "../../modules/ecr"
    vpc_id = module.vpc.vpc_id
    sg_id = module.security_groups.ecs_sg_id
    public_subnets = module.vpc.public_subnets
    # alb_target_group_arn = module.lb.aws_lb_target_group_arn
    # lb_listener_arn = module.lb.lb_listener_arn
    execution_role_arn = module.ecs_role.execution_role_arn
  
}


module "security_groups" {
    source = "../../modules/security"
    vpc_id = module.vpc.vpc_id
  
}

# module "lb" {
#     source = "../../modules/lb"
#     vpc_id = module.vpc.vpc_id
#     sg_id = module.security_groups.lb_sg_id
#     public_subnets = module.vpc.public_subnets
   
  
# }

module "ecs_role" {
    source = "../../modules/ecs_role"
  
}

module "auto_scalling" {
    source = "../../modules/auto_scalling"
    cluster_name = module.ecs.cluster_name
    service_name = module.ecs.service_name
  
}