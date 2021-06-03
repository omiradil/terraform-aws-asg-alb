resource "aws_autoscaling_group" "project" {
vpc_zone_identifier = [var.subnet1, var.subnet2]

  desired_capacity   = var.desired_capacity
  max_size           = var.max_size
  min_size           = var.min_size
  health_check_grace_period = var.health_check_grace_period
  health_check_type         = "ELB"

  mixed_instances_policy {
    instances_distribution {
      on_demand_base_capacity                  = var.on_demand_base_capacity
      on_demand_percentage_above_base_capacity = var.on_demand_percentage_above_base_capacity
      spot_allocation_strategy                 = "capacity-optimized"
    }
  

  launch_template {
      launch_template_specification {
        launch_template_id = aws_launch_template.project.id
      }
      

    override {
        instance_type     = var.mixed_instance1
      
      }

    override {
        instance_type     = var.mixed_instance2 
        
      }
  }
  
  }
}

resource "aws_spot_instance_request" "cheap_worker" {
  ami           = var.image_id
  spot_price    = var.spot_price
  instance_type = var.instance_type

}



