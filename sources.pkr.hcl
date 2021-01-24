source "vmware-iso" "ansible" {
  boot_command = lookup(local.boot_commands, lookup(lookup(local.os_list, var.os_name,{}), "os_family", ""), [])
  boot_wait = local.boot_wait
  communicator = local.communicator
  cpus = local.cpus
  disk_size = local.disk_size
  disk_type_id = 2
  guest_os_type = lookup(lookup(local.os_list, var.os_name,{}), "vmware", "")
  headless = local.headless
  http_directory = local.http_directory
  iso_checksum = lookup(lookup(local.os_list, var.os_name,{}), "iso_checksum", "")
  iso_url = lookup(lookup(local.os_list, var.os_name,{}), "iso_url", "")
  memory = local.memory
  output_directory = format("%s-%s-%s","output-vmware-iso",local.vm_name,local.build_ts)
  shutdown_command = local.shutdown_command
  ssh_password = var.ssh_password
  ssh_port = local.ssh_port
  ssh_timeout = local.ssh_timeout
  ssh_username = var.ssh_username
  version = 14
  vm_name = local.vm_name
}
