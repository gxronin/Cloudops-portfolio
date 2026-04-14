#!/bin/bash

# Update packages
yum update -y

# Install Apache
yum install -y httpd

# Start and enable Apache
systemctl start httpd
systemctl enable httpd

# Create a simple index.html
echo "<h1>Hello from $(hostname -f)</h1>" > /var/www/html/index.html