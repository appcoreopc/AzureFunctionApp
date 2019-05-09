# Outputs (used for ingestion by other modules)
output "rg_name" {
    value = "${azurerm_resource_group.azure-rg.name}"
}

output "rg_id" {
    value = "${azurerm_resource_group.azure-rg.id}"
}

output "rg_location" {
    value = "${azurerm_resource_group.azure-rg.location}"
}