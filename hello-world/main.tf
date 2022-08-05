terraform {
  required_providers {
    akash = {
      version = "0.0.3"
      source  = "cloud-j-luna/akash"
    }
  }
}

resource "akash_deployment" "hello_world" {
  sdl = file("${path.module}/sdl.yaml")
}

output "services" {
  value = akash_deployment.hello_world.services
}