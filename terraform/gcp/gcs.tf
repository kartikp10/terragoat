resource "google_storage_bucket" "terragoat_website" {
  name          = "terragot-${var.environment}"
  force_destroy = true
  labels = {
    yor_trace = "85b1ee1a-7316-4951-b936-0ef5ee0b27db"
  }
}

resource "google_storage_bucket_iam_binding" "allow_public_read" {
  bucket  = google_storage_bucket.terragoat_website.id
  members = ["allUsers"]
  role    = "roles/storage.objectViewer"
}