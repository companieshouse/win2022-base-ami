build {
  sources = [
    "source.amazon-ebs.builder",
  ]

  provisioner "powershell" {
    inline = [
      # Re-initialise the AWS instance on startup
      "& 'C:/Program Files/Amazon/EC2Launch/ec2launch' reset --block",
      # Remove system specific information from this image
      "& 'C:/Program Files/Amazon/EC2Launch/ec2launch' sysprep --shutdown --block",
    ]
  }
}
