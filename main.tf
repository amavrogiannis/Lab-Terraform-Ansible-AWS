module "instance" {
  source                 = "./modules/instances"
  vpc_security_group_ids = module.vpc.security_groups_public
  vpc_public_subnet_id   = module.vpc.public-sub
  vpc_private_subnet_id  = module.vpc.private-sub
}

module "vpc" {
  source = "./modules/network"
}
