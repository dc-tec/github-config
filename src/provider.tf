provider "github" {}

provider "azurerm" {
  features {
    key_vault {}
  }
}
