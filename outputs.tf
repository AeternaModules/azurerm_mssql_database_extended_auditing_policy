output "mssql_database_extended_auditing_policies_database_id" {
  description = "Map of database_id values across all mssql_database_extended_auditing_policies, keyed the same as var.mssql_database_extended_auditing_policies"
  value       = { for k, v in azurerm_mssql_database_extended_auditing_policy.mssql_database_extended_auditing_policies : k => v.database_id }
}
output "mssql_database_extended_auditing_policies_enabled" {
  description = "Map of enabled values across all mssql_database_extended_auditing_policies, keyed the same as var.mssql_database_extended_auditing_policies"
  value       = { for k, v in azurerm_mssql_database_extended_auditing_policy.mssql_database_extended_auditing_policies : k => v.enabled }
}
output "mssql_database_extended_auditing_policies_log_monitoring_enabled" {
  description = "Map of log_monitoring_enabled values across all mssql_database_extended_auditing_policies, keyed the same as var.mssql_database_extended_auditing_policies"
  value       = { for k, v in azurerm_mssql_database_extended_auditing_policy.mssql_database_extended_auditing_policies : k => v.log_monitoring_enabled }
}
output "mssql_database_extended_auditing_policies_retention_in_days" {
  description = "Map of retention_in_days values across all mssql_database_extended_auditing_policies, keyed the same as var.mssql_database_extended_auditing_policies"
  value       = { for k, v in azurerm_mssql_database_extended_auditing_policy.mssql_database_extended_auditing_policies : k => v.retention_in_days }
}
output "mssql_database_extended_auditing_policies_storage_account_access_key" {
  description = "Map of storage_account_access_key values across all mssql_database_extended_auditing_policies, keyed the same as var.mssql_database_extended_auditing_policies"
  value       = { for k, v in azurerm_mssql_database_extended_auditing_policy.mssql_database_extended_auditing_policies : k => v.storage_account_access_key }
  sensitive   = true
}
output "mssql_database_extended_auditing_policies_storage_account_access_key_is_secondary" {
  description = "Map of storage_account_access_key_is_secondary values across all mssql_database_extended_auditing_policies, keyed the same as var.mssql_database_extended_auditing_policies"
  value       = { for k, v in azurerm_mssql_database_extended_auditing_policy.mssql_database_extended_auditing_policies : k => v.storage_account_access_key_is_secondary }
}
output "mssql_database_extended_auditing_policies_storage_endpoint" {
  description = "Map of storage_endpoint values across all mssql_database_extended_auditing_policies, keyed the same as var.mssql_database_extended_auditing_policies"
  value       = { for k, v in azurerm_mssql_database_extended_auditing_policy.mssql_database_extended_auditing_policies : k => v.storage_endpoint }
}

