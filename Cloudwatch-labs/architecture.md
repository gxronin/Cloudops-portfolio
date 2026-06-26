[User / AWS Console]
↓
+-----------------+
|   CloudWatch    |
|   Dashboard     |
+-----------------+
↑
+-----------------+     +-------------------+
|   CloudWatch    |<--->|   SNS Topic       |
|   Alarms        |     | (Email/SMS)       |
+-----------------+     +-------------------+
↑
+-----------------+
|  CloudWatch     |
|  Metrics Repo   |
+-----------------+
↑
+-----------------+
| CloudWatch Agent|
| (running on EC2)|
+-----------------+
↑
+-----------------+
|  EC2 Instance   |
| (Amazon Linux)  |
+-----------------+
