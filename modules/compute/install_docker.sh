#!/bin/bash
set -e

LOG_FILE="/var/log/user-data-docker-install.log"

echo "Starting Docker installation at $(date)" | tee -a "$LOG_FILE"

dnf update -y | tee -a "$LOG_FILE"

dnf install -y docker | tee -a "$LOG_FILE"

systemctl enable docker | tee -a "$LOG_FILE"
systemctl start docker | tee -a "$LOG_FILE"

docker --version | tee -a "$LOG_FILE"

docker run -d \
  --name dev-test-app \
  --restart unless-stopped \
  -p 8080:80 \
  nginx:alpine

echo "Docker installation and test container completed at $(date)" | tee -a "$LOG_FILE"