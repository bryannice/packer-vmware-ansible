locals {
  boot_commands = {
    redhat = [
      "<tab> text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/kickstart-centos.cfg<enter><wait>"
    ]
    debian =  [
      "<esc><wait>",
      "install <wait>",
      "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed-debian.cfg <wait>",
      "debian-installer=en_US.UTF-8 <wait>",
      "auto <wait>",
      "locale=en_US.UTF-8 <wait>",
      "kbd-chooser/method=us <wait>",
      "keyboard-configuration/xkb-keymap=us <wait>",
      "netcfg/get_hostname={{ .Name }} <wait>",
      "netcfg/get_domain=vagrantup.com <wait>",
      "fb=false <wait>",
      "debconf/frontend=noninteractive <wait>",
      "console-setup/ask_detect=false <wait>",
      "console-keymaps-at/keymap=us <wait>",
      "grub-installer/bootdev=/dev/sda <wait>",
      "<enter><wait>"
    ]
  }
  boot_wait  = "10s"
  build_ts = formatdate("YYYY-MM-DD-hh-mm-ss", timestamp())
  code_project_name = split(".",basename(var.git_url))[0]
  communicator = "ssh"
  cpus = var.image_cpus
  disk_size = var.image_disk_size
  export_opts = [
    "--manifest",
    "--vsys",
    "0",
    "--description",
    var.image_description,
    "--version",
    var.image_version,
    "--ovf10"
  ]
  headless = false
  http_directory = "http"
  launch_block_device_mappings = {
    redhat = [
      {
        device_name = "/dev/sda1"
        delete_on_termination = "true"
        encrypted = false
        volume_size = 100
        volume_type = "gp2"
      }
    ]
    debian = [
      {
        device_name = "/dev/xvda"
        delete_on_termination = "true"
        encrypted = false
        volume_size = 100
        volume_type = "gp2"
      }
    ]
  }
  memory = var.image_memory
  os_list = {
    centos7-8 = {
      docker_image = "centos:7"
      image_offer = "CentOS"
      image_publisher = "OpenLogic"
      image_sku = "7_8"
      iso_checksum = "659691c28a0e672558b003d223f83938f254b39875ee7559d1a4a14c79173193"
      iso_url = "http://mirrors.ocf.berkeley.edu/centos/7.8.2003/isos/x86_64/CentOS-7-x86_64-Minimal-2003.iso"
      os_family = "redhat"
      os_type = "linux"
      ssh_username = "centos"
      source_ami = "ami-0eee2548cd75b4877"
      virtualbox = "RedHat_64"
      vmware = "centos7_64Guest"
    }
    centos8-2 = {
      docker_image = "centos:8"
      image_offer = "CentOS"
      image_publisher = "OpenLogic"
      image_sku = "8_2"
      iso_checksum = "47ab14778c823acae2ee6d365d76a9aed3f95bb8d0add23a06536b58bb5293c0"
      iso_url = "http://mirrors.ocf.berkeley.edu/centos/8.2.2004/isos/x86_64/CentOS-8.2.2004-x86_64-minimal.iso"
      os_family = "redhat"
      os_type = "linux"
      ssh_username = "centos"
      source_ami = "ami-0eee2548cd75b4877"
      virtualbox = "RedHat_64"
      vmware = "centos8_64Guest"
    }
    debian9-13 = {
      docker_image = "debian:9.13"
      image_offer = "Debian"
      image_publisher = "credativ"
      image_sku = "9"
      iso_checksum = "93863e17ac24eeaa347dfb91dddac654f214c189e0379d7c28664a306e0301e7"
      iso_url = "https://cdimage.debian.org/cdimage/archive/9.13.0/amd64/iso-cd/debian-9.13.0-amd64-netinst.iso"
      os_family = "debian"
      os_type = "linux"
      ssh_username = "admin"
      source_ami = "ami-072ad3956e05c814c"
      virtualbox = "Debian_64"
      vmware = "debian9_64Guest"
    }
    debian10-07 = {
      docker_image = "debian:10.7"
      image_offer = "debian-10"
      image_publisher = "Debian"
      image_sku = "10"
      iso_checksum = "b317d87b0a3d5b568f48a92dcabfc4bc51fe58d9f67ca13b013f1b8329d1306d"
      iso_url = "https://cdimage.debian.org/cdimage/release/10.7.0/amd64/iso-cd/debian-10.7.0-amd64-netinst.iso"
      os_family = "debian"
      os_type = "linux"
      ssh_username = "admin"
      source_ami = "ami-0f7939d313699273c"
      virtualbox = "Debian_64"
      vmware = "debian10_64Guest"
    }
    alpine3-13 = {
      docker_image = ""
      image_offer = ""
      image_publisher = ""
      image_sku = ""
      iso_checksum = "b7e5dcf17ea1807fd510855b659444c454247538a4e6847d52c170189953db34"
      iso_url = "https://dl-cdn.alpinelinux.org/alpine/v3.13/releases/x86_64/alpine-standard-3.13.0-x86_64.iso"
      os_family = ""
      os_type = "linux"
      ssh_username = ""
      source_ami = ""
      virtualbox = ""
      vmware = ""
    }
  }
  output_directory = format("%s-%s","output-iso", local.build_ts)
  shutdown_command = format("echo '%s' | sudo -S shutdown -hP now", var.ssh_username)
  ssh_port = 22
  ssh_timeout = "2h"
  vboxmanage = [
    [
      "modifyvm",
      "{{.Name}}",
      "--memory",
      var.image_memory
    ],
    [
      "modifyvm",
      "{{.Name}}",
      "--cpus",
      var.image_cpus
    ],
    [
      "modifyvm",
      "{{.Name}}",
      "--vram",
      "12"
    ],
    [
      "modifyvm",
      "{{.Name}}",
      "--natpf1",
      "SSH,tcp,127.0.0.1,2222,,22"
    ]
  ]
  vm_name = format("%s-%s-%s", var.os_name, var.image_name, var.image_version)
}