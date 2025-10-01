#!/bin/bash
set -e

echo " Deployment failed. Starting rollback..."

if [ -d "rollback-backup" ]; then
  echo " Restoring from rollback-backup..."

  rm -rf deployed_version
  cp -r rollback-backup deployed_version
 
  echo " Rollback complete."
else
  echo " No rollback-backup artifact found!"
  exit 1
fi
