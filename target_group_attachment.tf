resource "aws_autoscaling_attachment" "asg_attachment_project" {
  autoscaling_group_name = aws_autoscaling_group.project.id
  alb_target_group_arn   = aws_lb_target_group.project.arn
  
}

