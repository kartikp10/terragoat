resource "azurerm_managed_disk" "example" {
  name                 = "terragoat-disk-${var.environment}"
  location             = var.location
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 1
  encryption_settings {
    enabled = false
  }
  tags = {
    yor_trace = "27add81e-e512-424d-a3a5-4fce53cd166e"
  }
}

resource "azurerm_storage_account" "example" {
  name                     = "tgsa${var.environment}${random_integer.rnd_int.result}"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  queue_properties {
    logging {
      delete                = false
      read                  = false
      write                 = true
      version               = "1.0"
      retention_policy_days = 10
    }
    hour_metrics {
      enabled               = true
      include_apis          = true
      version               = "1.0"
      retention_policy_days = 10
    }
    minute_metrics {
      enabled               = true
      include_apis          = true
      version               = "1.0"
      retention_policy_days = 10
    }
  }
  tags = {
    yor_trace = "0af89bd6-721c-4c0d-b681-b451ff75deb2"
  }
}

resource "azurerm_storage_account_network_rules" "test" {
  resource_group_name  = azurerm_resource_group.example.name
  storage_account_name = azurerm_storage_account.example.name

  default_action = "Deny"
  ip_rules       = ["127.0.0.1"]
  bypass         = ["Metrics"]
}
