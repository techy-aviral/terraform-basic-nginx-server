module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source = "./modules/ec2"
  subnet_id = module.vpc.my_public_subnet
  vpc_security_group_ids = [module.security_group.security_group_id]
}
