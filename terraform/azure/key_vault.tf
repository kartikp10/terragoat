resource "azurerm_key_vault" "example" {
  name                = "terragoat-key-${var.environment}${random_integer.rnd_int.result}"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "premium"
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id
    key_permissions = [
      "create",
      "get",
    ]
    secret_permissions = [
      "set",
    ]
  }
  tags = {
    environment = var.environment
    terragoat   = true
    yor_trace   = "a1d4aa9d-3dd9-4576-ae80-df39dc940784"
  }
}

resource "azurerm_key_vault_key" "generated" {
  name         = "terragoat-generated-certificate-${var.environment}"
  key_vault_id = azurerm_key_vault.example.id
  key_type     = "RSA"
  key_size     = 2048
  key_opts = [
    "decrypt",
    "encrypt",
    "sign",
    "unwrapKey",
    "verify",
    "wrapKey",
  ]
  tags = {
    yor_trace = "ad83062a-a1e3-4cbd-9f6e-8182cd9dbaff"
  }
}

resource "azurerm_key_vault_secret" "secret" {
  key_vault_id = azurerm_key_vault.example.id
  name         = "terragoat-secret-${var.environment}"
  value        = random_string.password.result
  tags = {
    yor_trace = "ee5ea6fa-6bf3-4ab8-a9d6-87d177770740"
  }
}