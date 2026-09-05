rg = {
  devrg = "japaneast"
}

vnets = {
  vnetTechCorpApplication = {
    name                = "vnetTechCorpApplication"
    location            = "japaneast"
    resource_group_name = "devrg"
    address_space       = ["10.55.0.0/16"]
  }
}

snets = {
  snet1 = {
    name                 = "app-subnet"
    virtual_network_name = "vnetTechCorpApplication"
    resource_group_name  = "devrg"
    address_prefixes     = ["10.55.10.0/24"]
  }
  snet2 = {
    name                 = "AzureBastionSubnet"
    virtual_network_name = "vnetTechCorpApplication"
    resource_group_name  = "devrg"
    address_prefixes     = ["10.55.11.0/26"]
  }
}

nsgs = {
  nsg1 = {
    name                 = "nsgapptechcorp"
    resource_group_name  = "devrg"
    location             = "japaneast"
    virtual_network_name = "vnetTechCorpApplication"
    subnet_name          = "app-subnet"
  }
}

pip = {
  pip1 = {
    name                = "pip1"
    location            = "japaneast"
    resource_group_name = "devrg"
    allocation_method   = "Static"
  }
}

nic = {
  nic1 = {
    name                          = "nic1"
    location                      = "japaneast"
    resource_group_name           = "devrg"
    virtual_network_name          = "vnetTechCorpApplication"
    subnet_name                   = "app-subnet"
    ip_configuration_name         = "internal"
    private_ip_address_allocation = "Dynamic"
  }
}

bastion = {
  bastion1 = {
    name                  = "bastion1"
    location              = "japaneast"
    resource_group_name   = "devrg"
    virtual_network_name  = "vnetTechCorpApplication"
    subnet_name           = "AzureBastionSubnet"
    public_ip_name        = "pip1"
    ip_configuration_name = "configuration"
  }
}

