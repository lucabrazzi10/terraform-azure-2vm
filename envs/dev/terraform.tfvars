location            = "eastus"
resource_group_name = "rgs-dev"

tags = {
  environment = "dev"
  owner       = "yomi"
  cost_center = "rgs-lab"
}

allowed_ssh_cidrs = [
  # example: "1.2.3.4/32" if you ever open SSH from home/VPN
]

boot_diagnostics_storage_uri = ""  # e.g. "https://mystorage.blob.core.windows.net/" if you enable it

# Replace ssh_public_key with your actual public key from ~/.ssh/id_rsa.pub or id_ed25519.pub
vms = {
  "dev-vm01" = {
    vm_size        = "Standard_B1s"
    admin_username = "yomi"
    ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJFLVIQWeCycnT7B+Bxe3sO0TxduTnlwjfAyA2t3Ah0a yomi-terraform"
  }

  "dev-vm02" = {
    vm_size        = "Standard_B1s"
    admin_username = "yomi"
    ssh_public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJFLVIQWeCycnT7B+Bxe3sO0TxduTnlwjfAyA2t3Ah0a yomi-terraform"
  }
}