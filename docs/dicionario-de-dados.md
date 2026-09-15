# Dicionário de Dados — Oficina Mecânica

## 1. Tabela: `clientes`
| Coluna | Tipo | Nulo? | Descrição |
|---|---|---|---|
| `id` | UUID | NÃO (PK) | Identificador único do cliente |
| `nome` | VARCHAR(255) | NÃO | Nome completo |
| `cpf` | VARCHAR(11) | NÃO (UNIQUE) | CPF formatado/higienizado do cliente |
| `email` | VARCHAR(255) | NÃO | E-mail para contato e notificações |
| `telefone` | VARCHAR(20) | NÃO | Telefone do cliente |
| `status` | VARCHAR(20) | NÃO | Status cadastral (`ATIVO`, `INATIVO`) |
| `criado_em` | TIMESTAMP | NÃO | Data e hora do cadastro |

## 2. Tabela: `veiculos`
| Coluna | Tipo | Nulo? | Descrição |
|---|---|---|---|
| `id` | UUID | NÃO (PK) | Identificador único do veículo |
| `cliente_id` | UUID | NÃO (FK) | Referência ao proprietário (`clientes.id`) |
| `placa` | VARCHAR(10) | NÃO (UNIQUE) | Placa do veículo |
| `marca` | VARCHAR(50) | NÃO | Marca/Fabricante |
| `modelo` | VARCHAR(50) | NÃO | Modelo do veículo |
| `ano` | INTEGER | NÃO | Ano de fabricação/modelo |
| `cor` | VARCHAR(30) | NÃO | Cor do veículo |
| `status` | VARCHAR(20) | NÃO | Status (`ATIVO`, `INATIVO`) |

## 3. Tabela: `ordens_de_servico`
| Coluna | Tipo | Nulo? | Descrição |
|---|---|---|---|
| `id` | UUID | NÃO (PK) | Identificador da Ordem de Serviço |
| `cliente_id` | UUID | NÃO (FK) | Cliente associado à OS |
| `veiculo_id` | UUID | NÃO (FK) | Veículo associado à OS |
| `status` | VARCHAR(50) | NÃO | Status atual do fluxo (`RECEBIDA`, `EM_DIAGNOSTICO`, `AGUARDANDO_APROVACAO`, etc) |
| `descricao_problema` | TEXT | NÃO | Relato inicial do cliente |
| `laudo_diagnostico` | TEXT | SIM | Diagnóstico técnico da oficina |
| `valor_orcamento` | NUMERIC(10,2) | SIM | Valor total orçado de serviços + peças |
| `criada_em` | TIMESTAMP | NÃO | Data de abertura |
| `atualizada_em` | TIMESTAMP | NÃO | Data da última alteração |

## 4. Tabela: `historico_os`
| Coluna | Tipo | Nulo? | Descrição |
|---|---|---|---|
| `id` | UUID | NÃO (PK) | Identificador do registro histórico |
| `os_id` | UUID | NÃO (FK) | Referência à OS (`ordens_de_servico.id`) |
| `status_anterior` | VARCHAR(50) | SIM | Status antes da transição |
| `status_novo` | VARCHAR(50) | NÃO | Status após a transição |
| `alterado_por` | VARCHAR(100) | NÃO | Identificação de quem disparou a mudança |
| `observacao` | TEXT | SIM | Detalhes adicionais da mudança |
| `data_mudanca` | TIMESTAMP | NÃO | Timestamp exato da mudança |
