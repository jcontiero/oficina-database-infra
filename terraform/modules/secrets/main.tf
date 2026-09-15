resource "google_secret_manager_secret" "db_url_homolog" {
  secret_id = "database-url-homolog"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "db_url_homolog" {
  secret      = google_secret_manager_secret.db_url_homolog.id
  secret_data = "postgresql+psycopg://${var.db_user}:${var.db_password}@${var.db_ip}:5432/oficina_homolog"
}

resource "google_secret_manager_secret" "db_url_prod" {
  secret_id = "database-url-prod"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "db_url_prod" {
  secret      = google_secret_manager_secret.db_url_prod.id
  secret_data = "postgresql+psycopg://${var.db_user}:${var.db_password}@${var.db_ip}:5432/oficina_prod"
}

resource "google_secret_manager_secret" "db_password" {
  secret_id = "database-password"

  replication {
    auto {}
  }
}

resource "google_secret_manager_secret_version" "db_password" {
  secret      = google_secret_manager_secret.db_password.id
  secret_data = var.db_password
}
