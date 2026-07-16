output "netapp_snapshot_policies_id" {
  description = "Map of id values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "netapp_snapshot_policies_account_name" {
  description = "Map of account_name values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.account_name if v.account_name != null && length(v.account_name) > 0 }
}
output "netapp_snapshot_policies_daily_schedule" {
  description = "Map of daily_schedule values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.daily_schedule if v.daily_schedule != null && length(v.daily_schedule) > 0 }
}
output "netapp_snapshot_policies_enabled" {
  description = "Map of enabled values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.enabled if v.enabled != null }
}
output "netapp_snapshot_policies_hourly_schedule" {
  description = "Map of hourly_schedule values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.hourly_schedule if v.hourly_schedule != null && length(v.hourly_schedule) > 0 }
}
output "netapp_snapshot_policies_location" {
  description = "Map of location values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.location if v.location != null && length(v.location) > 0 }
}
output "netapp_snapshot_policies_monthly_schedule" {
  description = "Map of monthly_schedule values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.monthly_schedule if v.monthly_schedule != null && length(v.monthly_schedule) > 0 }
}
output "netapp_snapshot_policies_name" {
  description = "Map of name values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.name if v.name != null && length(v.name) > 0 }
}
output "netapp_snapshot_policies_resource_group_name" {
  description = "Map of resource_group_name values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.resource_group_name if v.resource_group_name != null && length(v.resource_group_name) > 0 }
}
output "netapp_snapshot_policies_tags" {
  description = "Map of tags values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "netapp_snapshot_policies_weekly_schedule" {
  description = "Map of weekly_schedule values across all netapp_snapshot_policies, keyed the same as var.netapp_snapshot_policies"
  value       = { for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : k => v.weekly_schedule if v.weekly_schedule != null && length(v.weekly_schedule) > 0 }
}

