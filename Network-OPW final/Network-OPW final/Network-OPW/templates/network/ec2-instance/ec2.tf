resource "aws_instance" "way4" {
  ami                           = var.ami
  instance_type                 = var.instance_type
  key_name                      = var.key_name
  vpc_security_group_ids        = ["${var.vpc_security_group_ids}"]
  subnet_id                     = "${var.subnet_id}"
  ebs_block_device {
    device_name                 = "/dev/sda1"
    volume_size                 = 100
    volume_type                 = "gp3"
    throughput                  = 125
    delete_on_termination       = false
  }
 tags = {
    Name                        = "${var.project_name}-${var.env}-way4"
    "organization"              = var.organization,
    "project-name"              = var.project_name,
    "environment"               = var.env,
    "resource-type"             = "instance",
    "component"                 = var.component,
    "team"                      = var.team,
    "owner"                     = var.owner,
    "iac"                       = var.iac,
    "site"                      = var.site,
    "canbedelete"               = var.canbedelete
 }
}
# resource "aws_eip" "eip_instance" {
#   vpc = true
# }
# resource "aws_eip_association" "eip_assoc" {
#   instance_id   = aws_instance.mimic.id
#   allocation_id = aws_eip.eip_instance.allocation_id
#   network_interface_id = aws_instance.mimic.primary_network_interface_id
# }



