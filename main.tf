terraform {
  required_providers {
    akash = {
      version = "0.3"
      source  = "joaoluna.com/cloud/akash"
    }
  }
}

provider "akash" {}

resource "akash_deployment" "my_deployment" {
  sdl = file("${path.module}/sdl.yaml")
}
