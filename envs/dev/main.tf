
module "vpc" {
    source = "../../modules/vpc" 
}



module "ecs" {
    source = "../../modules/ecr"
    vpc_id = module.vpc.vpc_id
    public_subnets = module.vpc.public_subnets
  
}