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
    tenant_id = "c7edfba3-a241-4b80-a92f-a311dc6cd2df"
    object_id = "90644e82-4c79-4c75-8d46-990215561997"

    key_permissions = [
      "create",
      "get",
    ]

    secret_permissions = [
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

  tags = {
    environment = "Production"
  }
}