resource "aws_launch_template" "project" {
  name_prefix          = "project"
  image_id             = var.image_id
  instance_type        = var.instance_type
  key_name             = aws_key_pair.asg_key_pair.key_name
  tags                 = var.tags
  
 
}
