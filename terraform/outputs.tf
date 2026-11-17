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
