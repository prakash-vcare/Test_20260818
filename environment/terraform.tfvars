devrgs = {
  rg1 = {
    name     = "rg_pch"
    location = "koreacentral"
  }
  rg2 = {
    name     = "rg_pch1"
    location = "koreacentral"
  }
}
devvnet = {
  vnet1 = {
    name                = "pchvnet"
    location            = "koreacentral"
    resource_group_name = "rg_pch"
    address_space       = ["172.0.0.0/16"]
  }
}
devsnet = {
  sub1 = {
    name                 = "pchsub1"
    resource_group_name  = "rg_pch"
    virtual_network_name = "pchvnet"
    address_prefixes     = ["172.0.1.0/24"]
  }
  sub2 = {
    name                 = "pchsub2"
    resource_group_name  = "rg_pch"
    virtual_network_name = "pchvnet"
    address_prefixes     = ["172.0.2.0/24"]
  }
}
devnsg = {
  nsg1 = {
    name                = "pchnsg1"
    location            = "koreacentral"
    resource_group_name = "rg_pch"

    security_rule = [
      {
        name                       = "devnsg1"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}
devpip = {
  pip1 = {
    pip_name            = "frontend_pip"
    resource_group_name = "rg_pch"
    location            = "koreacentral"
    allocation_method   = "Static"
  }
}
devnic = {
  nic1 = {
    nic_name             = "nic-fronend-vm"
    nic_location         = "koreacentral"
    nic_rg_name          = "rg_pch"
    subnet_name          = "pchsub1"
    virtual_network_name = "pchvnet"
    pip_name             = "frontend_pip"
  }
}
devnsgsub = {
  nsgsub1 = {
    subnet_name                 = "pchsub1"
    virtual_network_name        = "pchvnet"
    resource_group_name         = "rg_pch"
    network_security_group_name = "pchnsg1"
  }
}

devvms = {
  vm1 = {
    name                = "frontend-vm"
    location            = "koreacentral"
    nic_name            = "nic-fronend-vm"
    resource_group_name = "rg_pch"
    vm_size             = "Standard_D2s_v5"

    storage_image_reference = {
      publisher = "Canonical"
      offer     = "ubuntu-24_04-lts"
      sku       = "server"
      version   = "latest"
    }

    storage_os_disk = {
      name              = "pchdisk1"
      caching           = "ReadWrite"
      create_option     = "FromImage"
      managed_disk_type = "Standard_LRS"
    }

    os_profile = {
      computer_name  = "linuxvm1"
      admin_username = "pchpch"
      admin_password = "Pr@k@$h!@34"
    }

    os_profile_linux_config = {
      disable_password_authentication = false
    }

  }
}