output "secret_id_homolog" {
  value = google_secret_manager_secret.db_url_homolog.secret_id
}
output "secret_id_prod" {
  value = google_secret_manager_secret.db_url_prod.secret_id
}
