
module "vpc" {
    source = "../../modules/vpc" 
}



module "ecs" {
    source = "../../modules/ecr"
    vpc_id = module.vpc.vpc_id
    sg_id = module.security_groups.ecs_sg_id
    public_subnets = module.vpc.public_subnets
  
}


module "security_groups" {
    source = "../../modules/security"
    vpc_id = module.vpc.vpc_id
  
}

module "lb" {
    source = "../../modules/lb"
    sg_id = module.security_groups.lb_sg_id
    public_subnets = module.vpc.public_subnets
  
}