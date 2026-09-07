terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.77.0"

    }
  }

  backend "azurerm" {
    resource_group_name  = "rgtest"
    storage_account_name = "techcorpstorage"
    container_name       = "devtfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {
  }
}