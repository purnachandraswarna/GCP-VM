
resource "google_compute_instance" "default" {
  count=length(var.name_count)
  name         = join("-",[var.instance_name,(count.index)+1])
  machine_type = var.environment == "prod" ? var.machine_type_prod : var.machine_type_dev
  zone         = "us-central1-a"
  can_ip_forward = false
  description = "This is test virtual machine"

   tags = [ "allow-http","allow-https" ]
  
  boot_disk {
    initialize_params {
      image = var.image
      size = 20
    }
  }


metadata = {
    size = "20"
    foo = "bar"
}




labels = {
  "name" = (count.index)+1
  "machine_type" =  var.environment == "prod" ? var.machine_type_prod : var.machine_type_dev
}
  network_interface {
    network = "default"

  
  }

  
  

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }

  metadata_startup_script = "echo hi > /test.txt"

}


resource "google_compute_disk" "default" {
  name  = "test-disk"
  type  = "pd-ssd"
  zone  = "us-central1-a"
  size  = "10"
}

resource "google_compute_attached_disk" "default" {
  disk     = google_compute_disk.default.self_link
  instance = google_compute_instance.default[0].self_link
}





output "vm_name" { value= google_compute_instance.default.*.name}
output "vm_machine_type" { value= google_compute_instance.default.*.machine_type}

output "join_instance_id" { value = join("/",google_compute_instance.default.*.id)  }
