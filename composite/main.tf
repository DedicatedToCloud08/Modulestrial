module "network" {
  source = "../netwrok"
  vpc_cidr_block = var.vpc_cidr
  environment = var.environment
  availability_zone_tail = var.availability_zone_tail
  subnet_cidr = var.subnet_cidr
}

module "security" {
  source = "../security"
  vpc_id = module.network.vpc_id
  mypc = var.mypc
  environment = var.environment
}

module "compute" {
  source = "../compute"
  key_path = var.key_path
  instances = var.instances ## this is a map of strings
  subnet_id = module.network.subnet_id
  sg_id = module.security.sg_id
  environment = var.environment
}