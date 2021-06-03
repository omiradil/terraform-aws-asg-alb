resource "aws_key_pair" "asg_key_pair" {
  key_name   = var.key_name
  public_key = file(var.key_location)
  tags              = var.tags
}

