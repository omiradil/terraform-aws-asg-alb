resource "aws_security_group" "alb_sec_group" {
  name        = "alb_sec_group"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.vpc_id
  tags        = var.tags

  ingress {
    description = "TLS from VPC"
    from_port   = var.sec_group_ingress_from_port
    to_port     = var.sec_group_ingress_to_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
