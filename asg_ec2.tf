resource "aws_autoscaling_group" "web_asg" {
  name                      = "terraform-asg"
  max_size                  = 1
  min_size                  = 1
  desired_capacity          = 1
  vpc_zone_identifier       = ["subnet-0e0ada653854583e9"]

  launch_template {
    id      = aws_launch_template.web_template.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "bhavani"
    propagate_at_launch = true
  }
}



