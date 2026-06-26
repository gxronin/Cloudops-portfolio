AWS CloudWatch Agent Documentation
CloudWatch alarm and monitoring

---


## Data Flow

1. **EC2 Instance** → CloudWatch Agent collects CPU, Memory, Disk metrics every 60 seconds.
2. **CloudWatch Agent** → Pushes metrics to CloudWatch Metrics (namespace: `CWAgent`).
3. **CloudWatch** evaluates defined **Alarms** every 5 minutes.
4. When threshold is breached → Alarm state changes to **ALARM**.
5. Alarm triggers **SNS Topic** → Sends notification (Email/SMS).
6. **Dashboard** pulls and visualizes all metrics in real-time.

## Key Metrics Monitored

| Metric                | Source          | Namespace    | Alarm Created |
|-----------------------|-----------------|--------------|---------------|
| CPUUtilization        | EC2 Built-in    | AWS/EC2      | Yes           |
| mem_used_percent      | CloudWatch Agent| CWAgent      | Yes           |
| disk_used_percent     | CloudWatch Agent| CWAgent      | No (optional) |

---

## Resources Used

Ec2 Instance - CloudWatch-Lab-Instance (t2.micro)
IAM Role - "CloudWatchAgentRole
IAM Policy - CloudWatchAgentServicePolicy
Security Group - "Lab-SG"
VPC - 10.0.0.0/16
Subnet - public 10.0.0.1/24
Routing table - 0.0.0.0/0 to IGW
CloudWatch Agent - running on EC2
CloudWatch Metrics - "disk_used_percent" "mem_used_percent"
CloudWatch Alarms - "High-CPU-Alarm" , "High-Memory-Alarm"
CloudWatch Dashboard - Ec2 monitoring dashboard
SNS Topic - Triggered alarm notification by email



---


## CloudWatch Agent Configuration

{
  "agent": {
    "metrics_collection_interval": 60
  },
  "metrics": {
    "append_dimensions": {
      "InstanceId": "${aws:InstanceId}"
    },
    "metrics_collected": {
      "cpu": {
        "measurement": ["usage_active"]
      },
      "mem": {
        "measurement": ["mem_used_percent"]
      },
      "disk": {
        "measurement": ["used_percent"],
        "resources": ["*"]
      }
    }
  }
}



---


## Stress test script

$pkill stress
stress --cpu $(nproc) --vm 2 --vm-bytes 600M --timeout 900
