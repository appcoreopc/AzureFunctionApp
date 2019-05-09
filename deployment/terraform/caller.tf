provider "azurerm" {
    version = "~>1.5" 
}

module "test-rg" {
    source = "./modules/azure-rg"
    resource_group_name = "my-testing-payment-rg"
    
}

module "test-storage" {
    source = "./modules/azure-storage"
    resource_group_name = "${module.test-rg.rg_name}"
    location = "${module.test-rg.rg_location}"
    storagename = "appdevstoragename"
}

module "test-vault" {
    source = "./modules/azure-vault"
    resource_group_name = "${module.test-rg.rg_name}"    
    vaultname = "vaultapp"
    storevalue = "${module.test-storage.sas_url_query_string}"
    location = "${module.test-rg.rg_location}"
}


