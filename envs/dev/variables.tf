variable "location" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "vms" {
  description = "Dev VMs definition"
}

variable "boot_diagnostics_storage_uri" {
  type    = string
  default = ""
}

variable "allowed_ssh_cidrs" {
  description = "CIDRs allowed SSH if needed"
  type        = list(string)
  default     = []
}