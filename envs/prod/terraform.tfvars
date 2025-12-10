location            = "eastus2"
resource_group_name = "rgs-prod"

tags = {
  environment = "prod"
  owner       = "yomi"
  cost_center = "rgs-core"
}

allowed_ssh_cidrs = [
  # keep empty or add only secure CIDRs if you ever expose SSH via Bastion/jump
]

boot_diagnostics_storage_uri = "" # optional

# Use same or different SSH key(s), up to you
vms = {
  "prod-vm01" = {
    vm_size        = "Standard_B2s"
    admin_username = "yomi"
    ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJFLVIQWeCycnT7B+Bxe3sO0TxduTnlwjfAyA2t3Ah0a yomi-terraform"
  }

  "prod-vm02" = {
    vm_size        = "Standard_B2s"
    admin_username = "yomi"
    ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJFLVIQWeCycnT7B+Bxe3sO0TxduTnlwjfAyA2t3Ah0a yomi-terraform"
  }
}