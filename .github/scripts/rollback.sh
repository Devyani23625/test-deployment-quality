#!/bin/bash
set -e

echo " Deployment failed. Starting rollback..."

if [ -d "rollback-backup" ]; then
  echo " Restoring from rollback-backup..."

  rm -rf deployed_version
  cp -r rollback-backup deployed_version
  mkdir -p deployed_version
  echo "App version deployed at $(date)" > deployed_version/app.txt
 
  # Create a log file for this deployment
  mkdir -p logs
  echo "{\"status\": \"rollback success\", \"timestamp\": \"$(date)\"}" > logs/deployment_log.json
 
  echo " Rollback complete."
else
  echo " No rollback-backup artifact found!"
  exit 1
fi
