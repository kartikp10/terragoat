resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "48d3e596-baf5-4b1b-a8fa-58fd746e26ea"
  }
}