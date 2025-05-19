variable "location" {
  type    = string
  default = "Australia East"
}

variable "resource_group_name" {
  type    = string
  default = "AUT-2025-demo_2"
}

variable "storage_account_name" {
  type = string
}

variable "storage_account_tier" {
  type = string
  default = "Standard"
}

variable "storage_account_replication" {
  type = string
  default = "LRS"
}

variable "service_plan_name" {
  type = string
}

variable "service_plan_sku" {
  type = string
  default = "Y1"
}

variable "log_analytics_workspace_name" {
  type = string
  default = 'autdemo2-law'
}

variable "log_analytics_workspace_sku" {
  type = string
  default = "PerGB2018"
}
