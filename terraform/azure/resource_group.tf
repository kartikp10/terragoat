resource "azurerm_resource_group" "example" {
  name     = "terragoat-${var.environment}"
  location = var.location
  tags = {
    yor_trace = "72b045c7-824d-4fb9-bba8-61ff72b93b62"
  }
}