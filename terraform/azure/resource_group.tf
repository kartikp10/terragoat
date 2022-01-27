resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "e32685b3-660f-4f40-a2dc-c020d09c89c9"
  }
}