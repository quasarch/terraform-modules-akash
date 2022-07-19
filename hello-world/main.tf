terraform {
  required_providers {
    akash = {
      version = "0.3"
      source  = "joaoluna.com/cloud/akash"
    }
  }
}

provider "akash" {}

resource "akash_deployment" "hello_world" {
  sdl = file("${path.module}/sdl.yaml")
}

output "deployment_id" {
  value = akash_deployment.hello_world.id
}
