resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "047579b6-2fd2-457c-9042-7d11f71d5c9e"
  }
}