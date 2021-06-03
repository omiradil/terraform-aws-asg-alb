# AWS ASG with ALB and WAF Terraform module 

## The module creates:
- Autoscaling Group
- Application Load Balancer
- AWS WAF Classic with two blacklist rules (country name and IP set address)  

Prerequisite: VPC and subnets should be created prior to applying this module.  You can use your own AMI to customize the launch template.

### Copy this code into a .tf file and run terraform apply

```hcl
module "ASG-with-ALB" {
    source             = "omiradil/asg-alb/aws"
    region             = "us-east-1"
    vpc_id             = "vpc-0234cd7ed377fefe9"
    subnet1            = "subnet-0125f46f438c78275"
    subnet2            = "subnet-017bfd666a439d8aa"
    key_name           = "jump_box"
    key_location       = "~/.ssh/id_rsa.pub"

    # Launch template parameters
    image_id           = "ami-0d5eff06f840b45e9"
    instance_type      = "c5.large"
    
    # Autoscaling parameters
    desired_capacity   = 2
    max_size           = 2
    min_size           = 2
    health_check_grace_period = 300
    mixed_instance1     = "c4.large" 
    mixed_instance2     = "c3.large"
    on_demand_base_capacity = 0
    on_demand_percentage_above_base_capacity = 25
    spot_price         = "0.03"

    # Load Balancer parameters
    lb_port             = "80"
    lb_protocol         = "HTTP"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 3   
    interval            = 30
    

    # Security group ingress from/to ports
    sec_group_ingress_from_port = "80"
    sec_group_ingress_to_port   = "80"


    # WAF Classic parameters (specify CIDR block, for countries -specify 2-letter country code)
    blacklisted_ip_set1  = "192.0.7.0/24"
    blacklisted_ip_set2  = "192.168.0.0/24"
    blacklisted_country1 = "CN"
    blacklisted_country2 = "IR"

    tags = {
    Name = "ASG-with-ALB"
                    
    }
}

```