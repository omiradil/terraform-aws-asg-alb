resource "aws_lb_target_group" "project" {
  name     = "project"
  port     = var.lb_port
  protocol = var.lb_protocol
  vpc_id   = var.vpc_id
  
  health_check {
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    timeout             = var.timeout
    interval            = var.interval
  }
  
}

