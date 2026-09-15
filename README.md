# Oficina Mecânica - Infraestrutura de Banco de Dados
[![Quality gate](https://sonarcloud.io/api/project_badges/quality_gate?project=jcontiero_oficina-database-infra)](https://sonarcloud.io/summary/new_code?id=jcontiero_oficina-database-infra)
[![Vulnerabilities](https://sonarcloud.io/api/project_badges/measure?project=jcontiero_oficina-database-infra&metric=vulnerabilities)](https://sonarcloud.io/summary/new_code?id=jcontiero_oficina-database-infra)


## Propósito
Gerenciar e provisionar o banco de dados principal do sistema em modalidade "Gerenciada", garantindo isolamento de VPC, Backups Automáticos e armazenamento das credenciais com segurança.

## Tecnologias Utilizadas
- **Terraform**
- **Google Cloud SQL (PostgreSQL 16)**
- **Google Secret Manager**

## Passos para Execução e Deploy

**Execução e Deploy:**
A infraestrutura é provisionada automaticamente pelo GitHub Actions.
Para plano local:
1. `terraform init`
2. `terraform plan -var-file=environments/main.tfvars`

## Diagrama de Arquitetura

```mermaid
flowchart LR
    VPC(Private VPC) -->|Peering| CloudSQL[(Cloud SQL PostgreSQL)]
    CloudSQL -.-> SM(Secret Manager\nCredenciais)
```

## APIs e Documentação
**Não aplicável.** Repositório de provisionamento de recursos PaaS, sem endpoints públicos de software.
