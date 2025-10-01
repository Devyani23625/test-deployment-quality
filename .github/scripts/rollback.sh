#!/bin/bash
 
set -e
 
echo "🔴 Deployment failed. Starting rollback..."
 
# Simulate restoring the previous deployment artifact
if [ -d "./rollback_backup" ]; then
  echo "♻️ Restoring previous version from rollback_backup..."
  rm -rf deployed_version
  cp -r rollback_backup deployed_version
 
  echo "✅ Rollback complete. Previous version restored."
else
  echo "❌ No previous artifact found for rollback!"
  exit 1
fi
