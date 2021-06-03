variable "desired_capacity" {
    default    = 3
}
variable "max_size" {}

variable "min_size" {
    default    = 1
}
        
        
variable "instance_type" {
    default    = "c5.large"
}

# variable "ami_images" {}
# variable "ami_image_owners" {}
variable "region" {
    default             = "us-east-1"
}

variable "tags" {
    type = map
}   
variable "subnet1" {}
variable "subnet2" {}
variable "vpc_id" {}
variable "on_demand_base_capacity" {}
variable "on_demand_percentage_above_base_capacity" {}
variable "blacklisted_country1" {}
variable "blacklisted_country2" {}
variable "blacklisted_ip_set1" {}
variable "blacklisted_ip_set2" {}
variable "key_location" {}
variable "key_name" {}
variable "sec_group_ingress_from_port" {}
variable "sec_group_ingress_to_port" {}
variable "lb_port" {}
variable "lb_protocol" {}
variable "health_check_grace_period" {}
variable "healthy_threshold" {}
variable "unhealthy_threshold" {}
variable "timeout" {}
variable "interval" {}
variable "image_id" {}
variable "spot_price" {}
variable "mixed_instance1" {}
variable "mixed_instance2" {}
