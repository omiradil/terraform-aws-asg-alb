
resource "aws_lb" "project" {
  name               = "project"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb_sec_group.id]
  subnets            = [var.subnet1, var.subnet2]
  tags                = var.tags

  

}


