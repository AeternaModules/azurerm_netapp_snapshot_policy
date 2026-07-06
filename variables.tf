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
  # --- Unconfirmed validation candidates, derived from azurerm_netapp_snapshot_policy's provider source ---
  # Not auto-enabled: either a bespoke provider validator we can't safely translate,
  # or a path that crosses a list-typed block (needs its own for_each wrapping).
  # Review, translate into a real validation{} block above, and delete once confirmed.
  # path: name
  #   source:    [from netAppValidate.SnapshotName] !regexp.MustCompile(`^[\da-zA-Z][-_\da-zA-Z]{3,63}$`).MatchString(value)
  # path: resource_group_name
  #   condition: length(value) <= 90
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) > 90]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) > 90]
  # path: resource_group_name
  #   condition: !endswith(value, ".")
  #   message:   [from resourcegroups.ValidateName: must not end with "."]
  #   source:    [from resourcegroups.ValidateName: must not end with "."]
  # path: resource_group_name
  #   condition: length(value) != 0
  #   message:   [from resourcegroups.ValidateName: invalid when len(value) == 0]
  #   source:    [from resourcegroups.ValidateName: invalid when len(value) == 0]
  # path: resource_group_name
  #   source:    [from resourcegroups.ValidateName] !matched
  # path: location
  #   source:    location.EnhancedValidate: no recognizable `if ... { errors = append(...) }` pattern - read it by hand
  # path: account_name
  #   source:    [from netAppValidate.AccountName] !regexp.MustCompile(`^[-_\da-zA-Z]{3,64}$`).MatchString(value)
  # path: weekly_schedule.days_of_week[*]
  #   source:    validation.IsDayOfTheWeek(...) - no translation rule yet, add one
  # path: monthly_schedule.days_of_month[*]
  #   condition: value >= 1 && value <= 30
  #   message:   must be between 1 and 30
  # path: tags
  #   condition: length(value) <= 50
  #   message:   [from tags.Validate: invalid when len(value) > 50]
  #   source:    [from tags.Validate: invalid when len(value) > 50]
  # path: tags
  #   condition: length(value) <= 512
  #   message:   [from tags.Validate: invalid when len(value) > 512]
  #   source:    [from tags.Validate: invalid when len(value) > 512]
  # path: tags
  #   source:    [from tags.Validate] err != nil
  # path: tags
  #   condition: length(value) <= 256
  #   message:   [from tags.Validate: invalid when len(value) > 256]
  #   source:    [from tags.Validate: invalid when len(value) > 256]
}

