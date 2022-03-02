resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "107c1d9f-3e4b-4c17-ab15-bb6238addef1"
  }
}