resource "aws_launch_template" "web_template" {
  name_prefix   = "web-launch-template-"
  image_id      = "ami-0028824bd87b57adf"  
  instance_type = "t2.micro"

  user_data = base64encode(<<EOF
#!/bin/bash
sudo apt update -y
sudo apt install nginx -y
sudo systemctl start nginx
sudo systemctl enable nginx
EOF
  )

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "bhavani"
    }
  }
}
