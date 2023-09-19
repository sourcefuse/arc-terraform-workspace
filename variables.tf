################################################################################
## shared
################################################################################
variable "region" {
  type        = string
  default     = "us-west-2"
  description = "AWS region"
}

variable "workspace_properties" {
  description = "Workspace properties configuration."
  type = object({
    compute_type_name                         = string
    user_volume_size_gib                      = number
    root_volume_size_gib                      = number
    running_mode                              = string
    running_mode_auto_stop_timeout_in_minutes = number
  })
  default = {
    compute_type_name                         = "VALUE"
    user_volume_size_gib                      = 10
    root_volume_size_gib                      = 80
    running_mode                              = "ALWAYS_ON"
    running_mode_auto_stop_timeout_in_minutes = 60
  }
}

variable "user_names" {
  description = "List of usernames to create workspaces for"
  type        = map(string)
  default     = {}
}

variable "vpc_id" {
  description = "default vpc"
  type        = string
}

variable "subnet_ids" {
  description = "private subnet_ids"
  type        = list(string)
}

variable "workspaces_service_access_arn" {
  description = "workspaces service access from aws"
  type        = string
}

variable "workspaces_self_service_access_arn" {
  description = "workspaces self service access from aws"
  type        = string
}

variable "tags" {
  description = "tags to add to your resources"
  type        = map(string)
}

variable "directory_type" {
  description = "Type of the directory service (MicrosoftAD or ADConnector)."
  type        = string
  default     = "MicrosoftAD" # Provide a default value
}

variable "directory_name" {
  description = "must be a fully qualified domain name and cannot end with a trailing period"
  type        = string
  default     = "poc.woebothealth.com" # Provide a default value
}

variable "directory_size" {
  description = "The size of the directory (Small or Large are accepted values). Large by default."
  type        = string
  default     = "Small" # Provide a default value
}

# variable "directory_vpc_settings" {
#   description = "VPC settings for MicrosoftAD."
#   type = object({
#     vpc_id     = string
#     subnet_ids = list(string)
#   })
#   default = {
#     vpc_id     = ""
#     subnet_ids = []
#   }
# }

variable "directory_connect_settings" {
  description = "Connect settings for ADConnector."
  type = object({
    customer_dns_ips  = list(string)
    customer_username = string
    subnet_ids        = list(string)
    vpc_id            = string
  })
  default = {
    customer_dns_ips  = []
    customer_username = ""
    subnet_ids        = []
    vpc_id            = ""
  }
}

variable "self_service_permissions" {
  description = "Self-service permissions configuration."
  type = object({
    change_compute_type  = bool
    increase_volume_size = bool
    rebuild_workspace    = bool
    restart_workspace    = bool
    switch_running_mode  = bool
  })
  default = {
    change_compute_type  = false
    increase_volume_size = false
    rebuild_workspace    = false
    restart_workspace    = true
    switch_running_mode  = false
  }
}

variable "workspace_access_properties" {
  description = "Workspace access properties configuration."
  type = object({
    device_type_android    = string
    device_type_chromeos   = string
    device_type_ios        = string
    device_type_linux      = string
    device_type_osx        = string
    device_type_web        = string
    device_type_windows    = string
    device_type_zeroclient = string
  })
  default = {
    device_type_android    = "ALLOW"
    device_type_chromeos   = "ALLOW"
    device_type_ios        = "ALLOW"
    device_type_linux      = "ALLOW"
    device_type_osx        = "ALLOW"
    device_type_web        = "DENY"
    device_type_windows    = "ALLOW"
    device_type_zeroclient = "ALLOW"
  }
}

variable "workspace_creation_properties" {
  description = "Workspace creation properties configuration."
  type = object({
    custom_security_group_id            = string
    default_ou                          = string
    enable_internet_access              = bool
    enable_maintenance_mode             = bool
    user_enabled_as_local_administrator = bool
  })
  default = {
    custom_security_group_id            = ""
    default_ou                          = ""
    enable_internet_access              = false
    enable_maintenance_mode             = true
    user_enabled_as_local_administrator = true
  }
}

variable "bundle_id" {
  description = "The ID of the bundle to use for the workspaces."
  type        = string
  # You can specify a default value here if you have a default bundle ID.
  default = null # "wsb-gk1wpk43z"
}
