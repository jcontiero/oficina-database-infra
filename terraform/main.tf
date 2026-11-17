data "terraform_remote_state" "network_gke" {
  backend = "gcs"
  config = {
    bucket = "fiap-project-514922-tfstate"
    prefix = "platform/network-gke"
  }
}

module "cloud_sql" {
  source           = "./modules/cloud-sql"
  instance_name    = var.instance_name
  db_version       = var.db_version
  region           = var.region
  tier             = var.tier
  vpc_network_id   = data.terraform_remote_state.network_gke.outputs.vpc_network_id
  vpc_network_name = data.terraform_remote_state.network_gke.outputs.vpc_network_name
}
