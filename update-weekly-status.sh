#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Update Weekly Status
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🎲
# @raycast.packageName Status Updater

# Documentation:
# @raycast.description Updates Slack and GitLab status with a random funny message

# Get the directory where this script is located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd "$SCRIPT_DIR"
/usr/bin/python3 update_status.py
