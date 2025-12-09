resource "azurerm_network_interface" "nic" {
  for_each            = var.vms
  name                = "${each.key}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
  }

  tags = var.tags
}

resource "azurerm_linux_virtual_machine" "vm" {
  for_each            = var.vms
  name                = each.key
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = each.value.vm_size

  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id
  ]

  admin_username = each.value.admin_username

  admin_ssh_key {
    username   = each.value.admin_username
    public_key = each.value.ssh_public_key
  }

  disable_password_authentication = true

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts"
    version   = "latest"
  }

  dynamic "boot_diagnostics" {
    for_each = length(var.boot_diagnostics_storage_uri) > 0 ? [1] : []
    content {
      storage_account_uri = var.boot_diagnostics_storage_uri
    }
  }

  tags = var.tags
}
