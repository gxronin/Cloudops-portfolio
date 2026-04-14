# Cloudops-portfolio
# AWS Application Load Balancer with Auto Scaling

## Project Overview

This project demonstrates a highly available web architecture in AWS using

* Application Load Balancer (ALB)
* Auto Scaling Group (ASG)
* EC2 instances across multiple Availability Zones

## Architecture

* Internet-facing ALB
* Target Group with health checks
* Auto Scaling Group (min: 2, max: 4)
* EC2 instances running Apache web server

## Technologies Used

* AWS EC2
* AWS ALB
* AWS Auto Scaling
* Amazon Linux 2
* Apache (httpd)

## Deployment Steps

1. Create Launch Template with user data script
2. Create Target Group (HTTP, port 80)
3. Create Application Load Balancer
4. Create Auto Scaling Group and attach to target group
5. Verify load balancing via browser

## Testing

* Verified traffic distribution across instances
* Simulated failure by terminating an instance
* Observed automatic replacement via ASG

##  Screenshots

(adding .png later)

##  User Data Script

See `user-data.sh`

## Cleanup

* Delete Auto Scaling Group
* Delete Load Balancer
* Delete Target Group
* Terminate EC2 instances

## Key Learnings

* High availability architecture
* Load balancing concepts
* Auto scaling and self-healing systems
