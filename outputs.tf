output "netapp_snapshot_policies" {
  description = "All netapp_snapshot_policy resources"
  value       = azurerm_netapp_snapshot_policy.netapp_snapshot_policies
}
output "netapp_snapshot_policies_account_name" {
  description = "List of account_name values across all netapp_snapshot_policies"
  value       = [for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : v.account_name]
}
output "netapp_snapshot_policies_daily_schedule" {
  description = "List of daily_schedule values across all netapp_snapshot_policies"
  value       = [for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : v.daily_schedule]
}
output "netapp_snapshot_policies_enabled" {
  description = "List of enabled values across all netapp_snapshot_policies"
  value       = [for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : v.enabled]
}
output "netapp_snapshot_policies_hourly_schedule" {
  description = "List of hourly_schedule values across all netapp_snapshot_policies"
  value       = [for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : v.hourly_schedule]
}
output "netapp_snapshot_policies_location" {
  description = "List of location values across all netapp_snapshot_policies"
  value       = [for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : v.location]
}
output "netapp_snapshot_policies_monthly_schedule" {
  description = "List of monthly_schedule values across all netapp_snapshot_policies"
  value       = [for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : v.monthly_schedule]
}
output "netapp_snapshot_policies_name" {
  description = "List of name values across all netapp_snapshot_policies"
  value       = [for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : v.name]
}
output "netapp_snapshot_policies_resource_group_name" {
  description = "List of resource_group_name values across all netapp_snapshot_policies"
  value       = [for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : v.resource_group_name]
}
output "netapp_snapshot_policies_tags" {
  description = "List of tags values across all netapp_snapshot_policies"
  value       = [for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : v.tags]
}
output "netapp_snapshot_policies_weekly_schedule" {
  description = "List of weekly_schedule values across all netapp_snapshot_policies"
  value       = [for k, v in azurerm_netapp_snapshot_policy.netapp_snapshot_policies : v.weekly_schedule]
}

