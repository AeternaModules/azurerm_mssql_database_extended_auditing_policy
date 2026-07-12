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
    enabled                                          = optional(bool)   # Default: true
    log_monitoring_enabled                           = optional(bool)   # Default: true
    retention_in_days                                = optional(number) # Default: 0
    storage_account_access_key                       = optional(string)
    storage_account_access_key_key_vault_id          = optional(string)
    storage_account_access_key_key_vault_secret_name = optional(string)
    storage_account_access_key_is_secondary          = optional(bool) # Default: false
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
  # --- Unconfirmed validation candidates, derived from azurerm_mssql_database_extended_auditing_policy's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: database_id
  #   source:    [from commonids.ValidateSqlDatabaseID] !ok
  # path: database_id
  #   source:    [from commonids.ValidateSqlDatabaseID] err != nil
  # path: storage_endpoint
  #   source:    validation.IsURLWithHTTPS(...) - no translation rule yet, add one
}

