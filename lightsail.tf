resource "aws_lightsail_instance" "example" {
  name              = "lightsail-terraform-example"
  availability_zone = "us-east-1a" # Change this to your desired availability zone
  blueprint_id      = "amazon-linux-2-lts"
  bundle_id         = "nano_2_0"

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              echo "<h1>This Server is created using Terraform</h1>" | sudo tee /var/www/html/index.html
              EOF
}
