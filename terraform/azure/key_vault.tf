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
    yor_trace   = "541114ec-bbbf-4af2-bb4d-f3357d9609cd"
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
    yor_trace = "9435a5e4-97a1-4ada-9da6-ba7355da1d25"
  }
}

resource "azurerm_key_vault_secret" "secret" {
  key_vault_id = azurerm_key_vault.example.id
  name         = "terragoat-secret-${var.environment}"
  value        = random_string.password.result
  tags = {
    yor_trace = "2a302a62-2e04-4594-82ab-55095a706b52"
  }
}