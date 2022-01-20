resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "b10f9302-eba5-475d-b095-4de53589986c"
  }
}