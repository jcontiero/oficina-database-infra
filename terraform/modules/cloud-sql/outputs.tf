output "instance_name" {
  value = google_sql_database_instance.postgres.name
}
output "private_ip_address" {
  value = google_sql_database_instance.postgres.private_ip_address
}
output "connection_name" {
  value = google_sql_database_instance.postgres.connection_name
}
output "db_user" {
  value = google_sql_user.app_user.name
}
output "db_password" {
  value     = random_password.db_password.result
  sensitive = true
}
output "databases" {
  value = [
    google_sql_database.db_default.name,
    google_sql_database.db_homolog.name,
    google_sql_database.db_prod.name
  ]
}
