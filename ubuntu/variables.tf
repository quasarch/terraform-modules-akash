variable "ssh_port" {
  description = "The port for the SSH server to listen to."
  type = number
  default = 22000
}

variable "ssh_pubkey" {
  description = "The SSH public key."
  type = string
}