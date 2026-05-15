##--AWS EC2 Apache Web Server Deployment (HTTP + HTTPS Lab)

This project demonstrates how to deploy a basic web server using Amazon EC2, configure Apache2, and understand AWS networking fundamentals such as VPC, Subnets, Security Groups, and Internet Access. It also includes an introduction to HTTPS concepts using AWS best practices.

##-- Project Overview

In this lab, I built and configured a cloud-based web server using AWS. The project focuses on:

Launching an EC2 instance in a custom VPC
Configuring networking for public internet access
Installing and configuring Apache Web Server
Troubleshooting common AWS connectivity issues
Understanding HTTP vs HTTPS deployment
Preparing for secure production architecture using ALB + ACM


##--Architecture--

User Browser
     |
     | HTTP (Port 80)
     v
EC2 Instance (AWS Linux + Apache2)
     |
     v
AWS VPC (Public Subnet)
     |
Internet Gateway



##--AWS Services Used

Amazon EC2 (Ubuntu Server)
Amazon VPC
Subnets (Public Subnet)
Internet Gateway
Route Tables
Security Groups
(Optional Upgrade) Application Load Balancer (ALB)
(Optional Upgrade) AWS Certificate Manager (ACM)


##--Setup Steps
CIDR: 10.0.0.0/20
Public Subnet: 10.0.1.0/28
Internet Gateway attached
Route Table Configured for 0.0.0.0/0 to IGW


##-- Launch EC2 Instance
Amazon Linux 2023 kernel-6.1 AMI
T3.micro
Keypair for SSH
Auto-assign Public IP:Enable
SSH port 22 -> My IP
HTTP port 80 -> 0.0.0.0/0
HTTPS port 443 -> 0.0.0.0/0

##--Install Apache in terminal via SSH
sudo yum update -y
sudo yum install httpd
sudo systemctl start httpd
sudo yum instal enable httpd
sudo bash -c 'echo "<h1>Hello World from $(hostname -f)</h1>" > /var/www/html/index.html'
curl ifconfig.me


##--Test Web Server
http://MyPublic_IP

