variable "ansible_playbook_path" {
  default = ""
  description = "Ansible playbook path."
  type = string
}

variable "aws_ami_regions" {
  default = ""
  type = string
}

variable "az_resource_group_name" {
  default = "packer-build-rg"
  type = string
}

variable "az_subscription_id" {
  default = ""
  type = string
}

variable "az_tenant_id" {
  default = ""
  type = string
}

variable "client_id" {
  default = ""
  description = "Access key for AWS and client id for Azure."
  type = string
}

variable "client_secret" {
  default = ""
  description = "Secret key for AWS and client secret for Azure."
  type = string
}

variable "container_registry_password" {
  default = ""
  description = "Container registry password"
  type = string

}

variable "container_registry_server" {
  default = ""
  description = "Container registry server url"
  type = string
}

variable "container_registry_username" {
  default = ""
  description = "Container registry username"
  type = string
}

variable "container_repository" {
  default = "https://index.docker.io/v1/"
  description = "Docker repository to push built image to."
  type = string
}

variable "docker_environment_variable" {
  default = ""
  description = "Environment variable used by docker. Format is '--env COOL_VAR1=VALUE1 --env COOL_VAR2=VALUE2'"
  type = string
}

variable "docker_image_name" {
  default = ""
  description = "Docker image with the Ansible runtime environment."
  type = string
}

variable "docker_mounted_volume" {
  default = ""
  description = "Mount volumes needed to support the Ansible playbook process."
  type = string
}

variable "git_code_version" {
  default = "master"
  description = "Code version to use (branch or tag)."
  type = string
}

variable "git_url" {
  default = ""
  description = "Git repo"
  type = string
}

variable "image_cpus" {
  default = "4"
  type = string
}

variable "image_disk_size" {
  default = "50"
  description = "Image disk size. VMWare and VirtualBox this is number value representing MB. Azure this is a number value representing GB."
  type = string
}

variable "image_description" {
  default = "Image Built By Packer"
  type = string
}

variable "image_memory" {
  default = "8192"
  type = string
}

variable "image_name" {
  default = "packer"
  type = string
}

variable "image_version" {
  default = "0.0.0"
  type = string
}

variable "instance_type" {
  default = "Standard_D4a_v4"
  description = "The instance type for AWS and the VM Size for Azure."
  type = string
}

variable "os_name" {
  default = "centos7-8"
  description = "The OS name the packer build process create image from."
  type = string
}

variable "region" {
  default = "westus2"
  description = "The region for AWS and the location for Azure."
  type = string
}

variable "ssh_password" {
  default = "vagrant"
  description = "Password to use"
  type = string
}

variable "ssh_username" {
  default = "vagrant"
  description = "Username to use"
  type = string
}
