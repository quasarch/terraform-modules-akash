terraform {
  required_providers {
    akash = {
      version = "0.3"
      source  = "joaoluna.com/cloud/akash"
    }
  }
}

provider "akash" {}

resource "akash_deployment" "pkt_deployment" {
  count = var.number_instances

  sdl = templatefile("${path.module}/sdl.yaml", {
    wallet_addr = var.wallet_addr
  })
}

output "services" {
  value = akash_deployment.pkt_deployment.*.services
}
