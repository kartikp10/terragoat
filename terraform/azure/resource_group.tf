resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "0850668c-233e-4e86-bfc2-bf10f48296dc"
  }
}