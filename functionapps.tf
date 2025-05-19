resource "azurerm_storage_account" "storage" {
  name                     = "autdemos2torage1234"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_service_plan" "plan" {
  name                = "autdemo-function-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  sku_name            = "Y1"
}

resource "azurerm_linux_function_app" "function" {
  name                       = "autdemo2-functionapp1234"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  service_plan_id            = azurerm_service_plan.plan.id
  storage_account_name       = azurerm_storage_account.storage.name
  storage_account_access_key = azurerm_storage_account.storage.primary_access_key

  site_config {
    application_stack {
      node_version = "18"
    }
  }
}

# Example of using the full GitHub source for a module (uncomment and adapt as needed):
# module "function_app" {
#   source = "github.com/aztfmod/terraform-azurerm-caf//modules/function_app?ref=5.7.14"
#   resource_group_name = azurerm_resource_group.rg.name
#   location = azurerm_resource_group.rg.location
#   name = var.function_app_name
#   app_service_plan_id = azurerm_service_plan.plan.id
#   storage_account_name = azurerm_storage_account.storage.name
#   storage_account_access_key = azurerm_storage_account.storage.primary_access_key
#   os_type = "linux"
#   version = "~> 4.0"
# }
