data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "test" {
  name                = "${var.vaultname}"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group_name}"
  tenant_id           = "${data.azurerm_client_config.current.tenant_id}"

  sku {
    name = "premium"
  }

  access_policy {
    
   tenant_id = "${data.azurerm_client_config.current.tenant_id}"
    object_id = "${data.azurerm_client_config.current.service_principal_object_id}"

    key_permissions = [
      "create",
      "get",
    ]

    secret_permissions = [
      "set",
      "get",
      "delete",
      "list"
    ]
    
    storage_permissions = [
      "set",
      "get",
      "delete",
    ]
  }


 tags = {
    environment = "Production"
  }
}

resource "azurerm_key_vault_secret" "test" {
  name     = "secret-sauce"
  value    = "${var.storevalue}"
  key_vault_id = "${azurerm_key_vault.test.id}"

}
