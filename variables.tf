variable "netapp_snapshot_policies" {
  description = <<EOT
Map of netapp_snapshot_policies, attributes below
Required:
    - account_name
    - enabled
    - location
    - name
    - resource_group_name
Optional:
    - tags
    - daily_schedule (block):
        - hour (required)
        - minute (required)
        - snapshots_to_keep (required)
    - hourly_schedule (block):
        - minute (required)
        - snapshots_to_keep (required)
    - monthly_schedule (block):
        - days_of_month (required)
        - hour (required)
        - minute (required)
        - snapshots_to_keep (required)
    - weekly_schedule (block):
        - days_of_week (required)
        - hour (required)
        - minute (required)
        - snapshots_to_keep (required)
EOT

  type = map(object({
    account_name        = string
    enabled             = bool
    location            = string
    name                = string
    resource_group_name = string
    tags                = optional(map(string))
    daily_schedule = optional(object({
      hour              = number
      minute            = number
      snapshots_to_keep = number
    }))
    hourly_schedule = optional(object({
      minute            = number
      snapshots_to_keep = number
    }))
    monthly_schedule = optional(object({
      days_of_month     = set(number)
      hour              = number
      minute            = number
      snapshots_to_keep = number
    }))
    weekly_schedule = optional(object({
      days_of_week      = set(string)
      hour              = number
      minute            = number
      snapshots_to_keep = number
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.netapp_snapshot_policies : (
        length(v.resource_group_name) <= 90
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) > 90]"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_snapshot_policies : (
        !endswith(v.resource_group_name, ".")
      )
    ])
    error_message = "[from resourcegroups.ValidateName: must not end with \".\"]"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_snapshot_policies : (
        length(v.resource_group_name) != 0
      )
    ])
    error_message = "[from resourcegroups.ValidateName: invalid when len(value) == 0]"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_snapshot_policies : (
        v.hourly_schedule == null || (v.hourly_schedule.snapshots_to_keep >= 0 && v.hourly_schedule.snapshots_to_keep <= 255)
      )
    ])
    error_message = "must be between 0 and 255"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_snapshot_policies : (
        v.hourly_schedule == null || (v.hourly_schedule.minute >= 0 && v.hourly_schedule.minute <= 59)
      )
    ])
    error_message = "must be between 0 and 59"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_snapshot_policies : (
        v.daily_schedule == null || (v.daily_schedule.snapshots_to_keep >= 0 && v.daily_schedule.snapshots_to_keep <= 255)
      )
    ])
    error_message = "must be between 0 and 255"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_snapshot_policies : (
        v.daily_schedule == null || (v.daily_schedule.hour >= 0 && v.daily_schedule.hour <= 23)
      )
    ])
    error_message = "must be between 0 and 23"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_snapshot_policies : (
        v.daily_schedule == null || (v.daily_schedule.minute >= 0 && v.daily_schedule.minute <= 59)
      )
    ])
    error_message = "must be between 0 and 59"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_snapshot_policies : (
        v.weekly_schedule == null || (v.weekly_schedule.snapshots_to_keep >= 0 && v.weekly_schedule.snapshots_to_keep <= 255)
      )
    ])
    error_message = "must be between 0 and 255"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_snapshot_policies : (
        v.weekly_schedule == null || (v.weekly_schedule.hour >= 0 && v.weekly_schedule.hour <= 23)
      )
    ])
    error_message = "must be between 0 and 23"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_snapshot_policies : (
        v.weekly_schedule == null || (v.weekly_schedule.minute >= 0 && v.weekly_schedule.minute <= 59)
      )
    ])
    error_message = "must be between 0 and 59"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_snapshot_policies : (
        v.monthly_schedule == null || (v.monthly_schedule.snapshots_to_keep >= 0 && v.monthly_schedule.snapshots_to_keep <= 255)
      )
    ])
    error_message = "must be between 0 and 255"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_snapshot_policies : (
        v.monthly_schedule == null || (alltrue([for x in v.monthly_schedule.days_of_month : x >= 1 && x <= 30]))
      )
    ])
    error_message = "must be between 1 and 30"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_snapshot_policies : (
        v.monthly_schedule == null || (v.monthly_schedule.hour >= 0 && v.monthly_schedule.hour <= 23)
      )
    ])
    error_message = "must be between 0 and 23"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_snapshot_policies : (
        v.monthly_schedule == null || (v.monthly_schedule.minute >= 0 && v.monthly_schedule.minute <= 59)
      )
    ])
    error_message = "must be between 0 and 59"
  }
  validation {
    condition = alltrue([
      for k, v in var.netapp_snapshot_policies : (
        v.tags == null || (length(v.tags) <= 50)
      )
    ])
    error_message = "[from tags.Validate: invalid when len(value) > 50]"
  }
  # Note: 8 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

