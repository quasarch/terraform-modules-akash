


terraform {
  required_providers {
    akash = {
      version = "0.0.6"
      source  = "cloud-j-luna/akash"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}
provider "akash" {
  node          = "http://akash.c29r3.xyz:80/rpc"
  chain_id      = "akashnet-2"
  chain_version = "0.16.4"
}
provider "cloudflare" {
  api_token = var.CLOUD_FLARE_API_TOKEN
}
resource "akash_deployment" "my_deployment" {
  sdl = templatefile("./deployment-example.yaml", {
    #sdl = templatefile("./akash-deployment.yaml", {
    my_sql_root_password = var.WORDPRESS_DB_PASSWORD,
    my_sql_password      = var.WORDPRESS_DB_PASSWORD,
    my_sql_database      = "wordpress",
    my_sql_user          = "wordpress",
    wordpress_version    = "6.1.4"
    domain_url           = var.DOMAIN_URL
  })

}

output "services" {
  value = akash_deployment.my_deployment
}

#cloudflare
resource "cloudflare_record" "www" {
  zone_id = var.CLOUD_FLARE_ZONE_ID
  name    = "www"
  value   = replace( akash_deployment.my_deployment.services[1].service_uri, "/\\s.*/ /*", "")
  type    = "CNAME"
  proxied = true
}
resource "cloudflare_record" "root" {
  zone_id = var.CLOUD_FLARE_ZONE_ID
  name    = "@"
  value   = replace(akash_deployment.my_deployment.services[1].service_uri, "/\\s.*/ /*", "")
  type    = "CNAME"
  proxied = true
}
output "deployment_id" {
  value = akash_deployment.my_deployment.id
}

output "deployment_dseq" {
  value = akash_deployment.my_deployment.services[*]
}




