variable "vms" {
  description = "Map of VM configurations"
  type = map(object({
    vm_size        = string
    admin_username = string
    ssh_public_key = string
  }))
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  description = "Common tags to apply to VM resources"
  type        = map(string)
  default     = {}
}

variable "boot_diagnostics_storage_uri" {
  description = "Primary blob endpoint URI for boot diagnostics (e.g. https://mystorage.blob.core.windows.net/). Leave empty to disable."
  type        = string
  default     = ""
}
