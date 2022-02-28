resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "90046fa9-f5f4-404f-929f-c69422415cbb"
  }
}