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
  # path: hourly_schedule.snapshots_to_keep
  #   condition: value >= 0 && value <= 255
  #   message:   must be between 0 and 255
  # path: hourly_schedule.minute
  #   condition: value >= 0 && value <= 59
  #   message:   must be between 0 and 59
  # path: daily_schedule.snapshots_to_keep
  #   condition: value >= 0 && value <= 255
  #   message:   must be between 0 and 255
  # path: daily_schedule.hour
  #   condition: value >= 0 && value <= 23
  #   message:   must be between 0 and 23
  # path: daily_schedule.minute
  #   condition: value >= 0 && value <= 59
  #   message:   must be between 0 and 59
  # path: weekly_schedule.snapshots_to_keep
  #   condition: value >= 0 && value <= 255
  #   message:   must be between 0 and 255
  # path: weekly_schedule.days_of_week[*]
  #   source:    validation.IsDayOfTheWeek(...) - no translation rule yet, add one
  # path: weekly_schedule.hour
  #   condition: value >= 0 && value <= 23
  #   message:   must be between 0 and 23
  # path: weekly_schedule.minute
  #   condition: value >= 0 && value <= 59
  #   message:   must be between 0 and 59
  # path: monthly_schedule.snapshots_to_keep
  #   condition: value >= 0 && value <= 255
  #   message:   must be between 0 and 255
  # path: monthly_schedule.days_of_month[*]
  #   condition: value >= 1 && value <= 30
  #   message:   must be between 1 and 30
  # path: monthly_schedule.hour
  #   condition: value >= 0 && value <= 23
  #   message:   must be between 0 and 23
  # path: monthly_schedule.minute
  #   condition: value >= 0 && value <= 59
  #   message:   must be between 0 and 59
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

