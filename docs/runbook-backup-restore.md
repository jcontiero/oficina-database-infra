# Runbook: Backup e Restauração no Cloud SQL

## 1. Política de Backup
- **Backups automatizados diários** com início às 03:00 UTC.
- **Point-in-Time Recovery (PITR)** habilitado com 7 dias de retenção de logs WAL.
- Retenção de 7 snapshots diários.

## 2. Procedimento de Restauração (Point-in-Time)
Caso ocorra corrupção de dados ou incidente operacional:

1. Listar backups disponíveis:
   ```bash
   gcloud sql backups list --instance=oficina-postgres-db
   ```
2. Restaurar para uma nova instância clone a partir de um timestamp:
   ```bash
   gcloud sql instances clone oficina-postgres-db oficina-postgres-db-restaurado \
     --point-in-time="2026-09-14T10:00:00.000Z"
   ```
3. Validar a integridade das tabelas no clone.
4. Apontar a secret `database-url-prod` no Secret Manager para o novo IP caso necessário.
