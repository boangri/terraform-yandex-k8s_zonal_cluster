variable "name" {
    type        = string
    description = "Name of the cluster"
    default     = "control-plane"
}

variable "description" {
    type        = string
    description = "Name of the cluster"
    default     = "control-plane"
}

variable "zone" {
    type        = string
    default     = "ru-centail1-a"
}

variable "network_id" {
    type        = string
}

variable "subnet_id" {
    type        = string
}

variable "k8s_version" {
    type        = string
    description = "k8s version"
    default     = "1.21"
}

variable "service_account_id" {
    type        = string
}

variable "node_service_account_id" {
    type        = string
}