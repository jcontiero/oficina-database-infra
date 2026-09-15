output "cloud_sql_instance_name" {
  value       = module.cloud_sql.instance_name
  description = "Nome da instancia Cloud SQL"
}

output "cloud_sql_private_ip" {
  value       = module.cloud_sql.private_ip_address
  description = "IP privado do PostgreSQL"
}

output "cloud_sql_connection_name" {
  value       = module.cloud_sql.connection_name
  description = "Connection Name da instancia GCP"
}

output "secret_manager_homolog_key" {
  value       = module.secrets.secret_id_homolog
  description = "Secret Name para URL de conexao homologacao"
}

output "secret_manager_prod_key" {
  value       = module.secrets.secret_id_prod
  description = "Secret Name para URL de conexao producao"
}
