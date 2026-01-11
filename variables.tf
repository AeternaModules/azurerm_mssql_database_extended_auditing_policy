variable "mssql_database_extended_auditing_policys" {
  description = <<EOT
Map of mssql_database_extended_auditing_policys, attributes below
Required:
    - database_id
Optional:
    - enabled
    - log_monitoring_enabled
    - retention_in_days
    - storage_account_access_key
    - storage_account_access_key_is_secondary
    - storage_endpoint
EOT

  type = map(object({
    database_id                             = string
    enabled                                 = optional(bool, true)
    log_monitoring_enabled                  = optional(bool, true)
    retention_in_days                       = optional(number, 0)
    storage_account_access_key              = optional(string)
    storage_account_access_key_is_secondary = optional(bool, false)
    storage_endpoint                        = optional(string)
  }))
}

