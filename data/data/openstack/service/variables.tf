variable "image_name" {
  type        = "string"
  description = "The name of the Glance image for the bootstrap node."
}

variable "swift_container" {
  type        = "string"
  description = "The Swift container name for bootstrap ignition file."
}

variable "cluster_id" {
  type        = "string"
  description = "The identifier for the cluster."
}

variable "cluster_domain" {
  type        = "string"
  description = "The domain name of the cluster. All DNS records must be under this domain."
}

variable "ignition" {
  type        = "string"
  description = "The content of the bootstrap ignition file."
}

variable "flavor_name" {
  type        = "string"
  default     = "m1.medium"
  description = "The Nova flavor for the bootstrap node."
}

variable "service_port_id" {
  type        = "string"
  description = "The subnet ID for the bootstrap node."
}

variable "master_ips" {
  type = "list"
}

variable "master_port_names" {
  type = "list"
}

variable "bootstrap_ip" {
  type = "string"
}

variable "lb_floating_ip" {
  type = "string"
}
