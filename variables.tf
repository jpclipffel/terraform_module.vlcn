# code: language=Terraform tabSize=2


# =============================================================================
# General
# =============================================================================

variable "name" {
  description = "Instance name"
  type        = string
}

variable "hostname" {
  description = "Instance hostname"
  type        = string
}

variable "resource_pool_id" {
  description = "The resource pool ID"
  type        = string
}

variable "datastore_cluster_id" {
  description = "The datastore cluster ID"
  type        = string
}

variable "vm_folder" {
  description = "The VM folder path relative to the datacenter"
  type        = string
}

variable "guest_id" {
  description = "The guest VM ID, usually the VM (or VM template) guest ID"
  type        = string
}

variable "template_uuid" {
  description = "The UUID of the VM (or VM template) to clone"
  type        = string
}

# =============================================================================
# CPU and memory
# =============================================================================

variable "num_cpus" {
  description = "The number of CPU and CPU core per socket"
  type        = number
  default     = 1
}

variable "memory" {
  description = "The amount of memory in MB"
  type        = number
  default     = 1024
}

# =============================================================================
# Networks
# =============================================================================

variable "network_id" {
  description = "The ID of the primary network"
}

variable "network_iface" {
  description = "The primary network interface name"
}

variable "network_addr" {
  description = "The primary network interface address"
  type        = string
}

variable "network_mask" {
  description = "The primary network interface mask"
  type        = string
}

variable "network_gw_addr" {
  description = "The primary network interface gateway address"
  type        = string
}

variable "network_ns_addr" {
  description = "The primary network interface name server I{}"
  type        = string
}

# =============================================================================
# Disk
# =============================================================================

variable "disk_system_label" {
  description = "The system disk name (label)"
  type        = string
  default     = "disk0"
}

variable "disk_system_size" {
  description = "The system disk dize in GB"
  type        = number
  default     = 126
}

# =============================================================================
# User
# =============================================================================

variable "user_name" {
  description = "The default user name"
  type        = string
  default     = "ansctl"
}

variable "user_password" {
  description = "The default user password"
  type        = string
  default     = "ansctl"
}

variable "user_public_key_file" {
  description = "The default user SSH public key"
  type        = string
  default     = "~/.ssh/ansctl.rsa.pub"
}
