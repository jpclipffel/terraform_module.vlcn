# Terraform module: vLCN
_vLCN: vSphere - Linux - Cloudinit - Netplan_

A Terraform module to deploy a Linux virtual machine with Cloudinit and
Netplan.

This module can be used as the fundamental building block to deploy a standard
Linux virtual machine, as long as the source image uses [Cloudinit] and
Netplan [Netplan].

This module is designed to be used in conjunction with the
[ICT's Terraform project].

## Design choices

This module **bootstrap** a running Linux instance, which is ready to be
onboarded into Ansible. Thus, some design choices has been made to simplify
the process:

* The default user name is `ansctl`
* The default user can login **only** via SSH using `ansctl`'s public key

## Usage

### Variables

The file `variables.tf` is self-describing.

### Example

```Terraform
module "vlcn-test" {
  # Meta
  source                = "../../modules/vsphere_linux_cinit_netplan"
  name                  = "vlcn-test"
  hostname              = "vlcn-test"
  # General
  resource_pool_id      = data.vsphere_resource_pool.kirchberg_low.id
  datastore_cluster_id  = data.vsphere_datastore_cluster.default.id
  vm_folder             = "_root/DATI : ICT"
  guest_id              = data.vsphere_virtual_machine.template_ubuntu.guest_id
  template_uuid         = data.vsphere_virtual_machine.template_ubuntu.id
  # Network
  network_id            = data.vsphere_network.devops.id
  network_iface         = "ens192"
  network_addr          = "172.29.252.72"
  network_mask          = "24"
  network_gw_addr       = "172.29.252.1"
  network_ns_addr       = "172.29.245.1"
}
```

---

[Cloudinit]: https://cloudinit.readthedocs.io
[Netplan]: https://netplan.io/
[ICT's Terraform project]: https://git.dt.ept.lu/ict-infra/iac/terraform/projects/ict
