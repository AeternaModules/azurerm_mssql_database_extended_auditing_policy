variable "mssql_database_extended_auditing_policies" {
  description = <<EOT
Map of mssql_database_extended_auditing_policies, attributes below
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
    enabled                                 = optional(bool)   # Default: true
    log_monitoring_enabled                  = optional(bool)   # Default: true
    retention_in_days                       = optional(number) # Default: 0
    storage_account_access_key              = optional(string)
    storage_account_access_key_is_secondary = optional(bool) # Default: false
    storage_endpoint                        = optional(string)
  }))
}

