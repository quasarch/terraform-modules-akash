terraform {
  required_providers {
    akash = {
      version = "0.0.3"
      source  = "joao-luna-98/akash"
    }
  }
}

resource "akash_deployment" "linux" {
  sdl = templatefile("${path.module}/sdl.yaml", {
    ssh_port   = var.ssh_port
    ssh_pubkey = var.ssh_pubkey
  })
}

output "services" {
  value = akash_deployment.linux.services
}
