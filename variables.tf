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
    - storage_account_access_key_key_vault_id (alternative to storage_account_access_key - read from Key Vault instead)
    - storage_account_access_key_key_vault_secret_name (alternative to storage_account_access_key - read from Key Vault instead)
    - storage_account_access_key_is_secondary
    - storage_endpoint
EOT

  type = map(object({
    database_id                                      = string
    enabled                                          = optional(bool)
    log_monitoring_enabled                           = optional(bool)
    retention_in_days                                = optional(number)
    storage_account_access_key                       = optional(string)
    storage_account_access_key_key_vault_id          = optional(string)
    storage_account_access_key_key_vault_secret_name = optional(string)
    storage_account_access_key_is_secondary          = optional(bool)
    storage_endpoint                                 = optional(string)
  }))
  validation {
    condition = alltrue([
      for k, v in var.mssql_database_extended_auditing_policies : (
        v.storage_account_access_key == null || (length(v.storage_account_access_key) > 0)
      )
    ])
    error_message = "must not be empty"
  }
  validation {
    condition = alltrue([
      for k, v in var.mssql_database_extended_auditing_policies : (
        v.retention_in_days == null || (v.retention_in_days >= 0 && v.retention_in_days <= 3285)
      )
    ])
    error_message = "must be between 0 and 3285"
  }
  # Note: 3 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

