variable "wallet_addr" {
    description = "Address of the wallet"
    type = string
}

variable "number_instances" {
    description = "Number of instances to run. If set to >1 set --parallelism=1"
    type = number
    default = 1
}