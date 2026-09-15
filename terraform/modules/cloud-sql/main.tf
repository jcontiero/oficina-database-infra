resource "random_password" "db_password" {
  length  = 24
  special = false
}

data "google_compute_network" "vpc" {
  name = var.vpc_network_name
}

resource "google_sql_database_instance" "postgres" {
  name             = var.instance_name
  database_version = var.db_version
  region           = var.region

  settings {
    tier              = var.tier
    availability_type = "ZONAL" # Para otimizar custos no Tech Challenge
    disk_size         = 10
    disk_type         = "PD_SSD"
    disk_autoresize   = true

    ip_configuration {
      ipv4_enabled                                  = false
      private_network                               = data.google_compute_network.vpc.id
      enable_private_path_for_google_cloud_services = true
    }

    backup_configuration {
      enabled                        = true
      start_time                     = "03:00"
      point_in_time_recovery_enabled = true
      transaction_log_retention_days = 7
      backup_retention_settings {
        retained_backups = 7
      }
    }

    insights_config {
      query_insights_enabled  = true
      query_string_length     = 1024
      record_application_tags = true
      record_client_address   = true
    }

    database_flags {
      name  = "log_connections"
      value = "on"
    }
    database_flags {
      name  = "log_disconnections"
      value = "on"
    }
  }

  deletion_protection = false # Permitir gerenciar via Terraform no desafio
}

resource "google_sql_database" "db_homolog" {
  name     = "oficina_homolog"
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_database" "db_prod" {
  name     = "oficina_prod"
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_database" "db_default" {
  name     = "oficina"
  instance = google_sql_database_instance.postgres.name
}

resource "google_sql_user" "app_user" {
  name     = "oficina_user"
  instance = google_sql_database_instance.postgres.name
  password = random_password.db_password.result
}
