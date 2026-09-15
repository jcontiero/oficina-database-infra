variable "project_id" {
  type        = string
  description = "GCP Project ID"
  default     = "pos-fiap-2026"
}

variable "region" {
  type        = string
  description = "Região GCP"
  default     = "us-central1"
}

variable "instance_name" {
  type        = string
  description = "Nome da instancia Cloud SQL"
  default     = "oficina-postgres-db"
}

variable "db_version" {
  type        = string
  description = "Versao do PostgreSQL"
  default     = "POSTGRES_16"
}

variable "tier" {
  type        = string
  description = "Tipo de maquina Cloud SQL"
  default     = "db-f1-micro"
}

variable "vpc_network_name" {
  type        = string
  description = "Nome da VPC criada no repositorio oficina-k8s-infra"
  default     = "oficina-vpc"
}
