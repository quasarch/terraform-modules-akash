terraform {
  required_providers {
    akash = {
      version = "0.0.4"
      source  = "cloud-j-luna/akash"
    }
  }
}

resource "akash_deployment" "vpn" {
  sdl = file("${path.module}/sdl.yaml")
}

output "services" {
  value = akash_deployment.vpn.services
}
