variable "ami_account_ids" {
  type        = list(string)
  description = "A list of account IDs that have access to launch the resulting AMI(s)"
}

variable "ami_name_prefix" {
  type        = string
  default     = "win2022-base"
  description = "The prefix string that will be used for the name tags of the resulting AMI and snapshot(s); the version string will be appended automatically"
}

variable "aws_instance_type" {
  type        = string
  default     = "t3.medium"
  description = "The EC2 instance type used when building the AMI"
}

variable "aws_region" {
  type        = string
  default     = "eu-west-2"
  description = "The AWS region in which the AMI will be built"
}

variable "aws_source_ami_filter_name" {
  type        = string
  default     = "Windows_Server-2022-English-Full-Base-*"
  description = "The source AMI filter string. Any filter described by the DescribeImages API documentation is valid. If multiple images match then the latest will be used"
}

variable "aws_source_ami_owner_id" {
  type        = string
  description = "The source AMI owner ID; used in combination with aws_source_ami_filter_name to filter for matching source AMIs"
  default     = "amazon"
}

variable "aws_subnet_filter_name" {
  type        = string
  description = "The subnet filter string. Any filter described by the DescribeSubnets API documentation is valid. If multiple subnets match then the one with the most IPv4 addresses free will be used"
}

variable "encrypt_boot" {
  type        = bool
  default     = false
  description = "Whether to encrypt the root volume of the AMI (and instances created from it)"
}

variable "force_delete_snapshot" {
  type        = bool
  default     = false
  description = "Delete snapshots associated with AMIs, which have been deregistered by force_deregister"
}

variable "force_deregister" {
  type        = bool
  default     = false
  description = "Deregister an existing AMI if one with the same name already exists"
}

variable "kms_key_id" {
  type        = string
  default     = null
  description = "KMS key ID, arn or alias to use for root volume encryption in the main region. If encrypt_boot is true and this is left null, the AWS default key is used"
}

variable "powershell_path" {
  type        = string
  description = "Path to the build-time powershell scripts"
  default     = "../powershell"
}

variable "root_volume_size_gb" {
  type        = number
  default     = 40
  description = "The EC2 instance root volume size in Gibibytes (GiB)"
}

variable "ssh_private_key_file" {
  type        = string
  default     = "/home/packer/.ssh/packer-builder"
  description = "The path to the common Packer builder private SSH key"
}

variable "version" {
  type        = string
  description = "The semantic version number for the AMI; the version string will be appended automatically to the name tags added to the resulting AMI and snapshot(s)"
}

variable "winrm_insecure" {
  type        = bool
  description = "Skip validation of the server certificate on WinRM connections (true) or validate (false)"
  default     = true
}

variable "winrm_timeout" {
  type        = string
  description = "Delay before WinRM-HTTPS connections time-out"
  default     = "15m"
}

variable "winrm_username" {
  type        = string
  description = "Username for WinRM connections"
  default     = "Administrator"
}

variable "winrm_use_ssl" {
  type        = bool
  description = "Defines whether to use SSL for WinRM communications (true) or not (false)"
  default     = true
}
