module "cloud_sql" {
  source           = "./modules/cloud-sql"
  instance_name    = var.instance_name
  db_version       = var.db_version
  region           = var.region
  tier             = var.tier
  vpc_network_name = var.vpc_network_name
}

module "secrets" {
  source      = "./modules/secrets"
  db_user     = module.cloud_sql.db_user
  db_password = module.cloud_sql.db_password
  db_ip       = module.cloud_sql.private_ip_address
}
