resource "azurerm_netapp_snapshot_policy" "netapp_snapshot_policies" {
  for_each = var.netapp_snapshot_policies

  account_name        = each.value.account_name
  enabled             = each.value.enabled
  location            = each.value.location
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  dynamic "daily_schedule" {
    for_each = each.value.daily_schedule != null ? [each.value.daily_schedule] : []
    content {
      hour              = daily_schedule.value.hour
      minute            = daily_schedule.value.minute
      snapshots_to_keep = daily_schedule.value.snapshots_to_keep
    }
  }

  dynamic "hourly_schedule" {
    for_each = each.value.hourly_schedule != null ? [each.value.hourly_schedule] : []
    content {
      minute            = hourly_schedule.value.minute
      snapshots_to_keep = hourly_schedule.value.snapshots_to_keep
    }
  }

  dynamic "monthly_schedule" {
    for_each = each.value.monthly_schedule != null ? [each.value.monthly_schedule] : []
    content {
      days_of_month     = monthly_schedule.value.days_of_month
      hour              = monthly_schedule.value.hour
      minute            = monthly_schedule.value.minute
      snapshots_to_keep = monthly_schedule.value.snapshots_to_keep
    }
  }

  dynamic "weekly_schedule" {
    for_each = each.value.weekly_schedule != null ? [each.value.weekly_schedule] : []
    content {
      days_of_week      = weekly_schedule.value.days_of_week
      hour              = weekly_schedule.value.hour
      minute            = weekly_schedule.value.minute
      snapshots_to_keep = weekly_schedule.value.snapshots_to_keep
    }
  }
}

