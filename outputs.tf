output "netapp_snapshot_policies_id" {
  description = "Map of id values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.id }
}
output "netapp_snapshot_policies_account_name" {
  description = "Map of account_name values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.account_name }
}
output "netapp_snapshot_policies_daily_schedule" {
  description = "Map of daily_schedule values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.daily_schedule }
}
output "netapp_snapshot_policies_enabled" {
  description = "Map of enabled values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.enabled }
}
output "netapp_snapshot_policies_hourly_schedule" {
  description = "Map of hourly_schedule values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.hourly_schedule }
}
output "netapp_snapshot_policies_location" {
  description = "Map of location values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.location }
}
output "netapp_snapshot_policies_monthly_schedule" {
  description = "Map of monthly_schedule values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.monthly_schedule }
}
output "netapp_snapshot_policies_name" {
  description = "Map of name values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.name }
}
output "netapp_snapshot_policies_resource_group_name" {
  description = "Map of resource_group_name values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.resource_group_name }
}
output "netapp_snapshot_policies_tags" {
  description = "Map of tags values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.tags }
}
output "netapp_snapshot_policies_weekly_schedule" {
  description = "Map of weekly_schedule values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.weekly_schedule }
}

