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
    yor_trace = "a2083254-8546-4467-9926-9458bb1bda36"
  }
}

resource google_compute_disk "unencrypted_disk" {
  name = "terragoat-${var.environment}-disk"
  labels = {
    yor_trace = "9e957385-9fac-48f0-820a-93115d82ea8a"
  }
}