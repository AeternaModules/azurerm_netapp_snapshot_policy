variable "netapp_snapshot_policys" {
  description = <<EOT
Map of netapp_snapshot_policys, attributes below
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
      days_of_month     = set(string)
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
}

