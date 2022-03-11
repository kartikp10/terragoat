data google_compute_zones "zones" {}

resource google_compute_instance "server" {
  machine_type = "n1-standard-1"
  name         = "terragoat-${var.environment}-machine"
  zone         = data.google_compute_zones.zones.names[0]
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
    auto_delete = true
  }
  network_interface {
    subnetwork = google_compute_subnetwork.public-subnetwork.name
    access_config {}
  }
  can_ip_forward = true

  metadata = {
    block-project-ssh-keys = false
    enable-oslogin         = false
    serial-port-enable     = true
  }
  labels = {
    yor_trace = "cfd1fd56-3797-4c33-887e-45336b426c26"
  }
}

resource google_compute_disk "unencrypted_disk" {
  name = "terragoat-${var.environment}-disk"
  labels = {
    yor_trace = "2cb807ac-4899-4589-9496-07fedbb2e2e9"
  }
}