# code: language=Terraform tabSize=2


resource "vsphere_virtual_machine" "instance" {
  # General
  name                  = var.name
  resource_pool_id      = var.resource_pool_id
  datastore_cluster_id  = var.datastore_cluster_id
  folder                = var.vm_folder
  num_cpus              = var.num_cpus
  num_cores_per_socket  = var.num_cpus
  memory                = var.memory
  guest_id              = var.guest_id

  # Virtual machine template
  clone {
    template_uuid = var.template_uuid
  }

  # Network interface
  network_interface {
    network_id  = var.network_id
  }

  # System disk
  disk {
    label             = var.disk_system_label
    size              = var.disk_system_size
    thin_provisioned  = false
    eagerly_scrub     = false
  }

  # Cloud-init cdrom
  cdrom {
    client_device = true
  }

  # Cloud-init configuration
  vapp {
    properties ={
      hostname = var.hostname
      user-data = base64encode(
        templatefile(
          "${path.module}/templates/cinit.yaml", {
            # User
            user_name         = var.user_name,
            user_password     = var.user_password,
            user_public_key   = file(pathexpand(var.user_public_key_file)),
            # Network
            network_iface     = var.network_iface,
            network_addr      = var.network_addr,
            network_mask      = var.network_mask,
            network_gw_addr   = var.network_gw_addr,
            network_ns_addr   = var.network_ns_addr,
            # Misc
            hostname          = var.hostname
          }
        )
      )
    }
  }

  lifecycle {
    ignore_changes = [
      disk,
      sync_time_with_host
    ]
  }
}
