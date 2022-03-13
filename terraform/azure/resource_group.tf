resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "13b3a0ad-847c-414f-94dd-fd591bafed3f"
  }
}