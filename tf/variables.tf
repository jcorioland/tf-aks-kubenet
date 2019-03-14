variable "client_id" {}
variable "client_secret" {}


variable "agent_count" {
    default = 2
}

variable "ssh_public_key" {
    default = "~/.ssh/id_rsa.pub"
}

variable "dns_prefix" {
    default = "aksjco"
}

variable cluster_name {
    default = "aksjco"
}

variable resource_group_name {
    default = "aksjco-rg"
}

variable location {
    default = "westeurope"
}

variable network_plugin {
    default = "kubenet"
}