#!/usr/bin/env bash

# Absolute path to the file inside the installed package
TARGET_FILE=".venv/lib/python3.11/site-packages/dateutil/tz/tz.py"

# Fix the import error caused by newspaper3k
# Only replace if it exists and has the broken line
if grep -q "from six.moves import _thread" "$TARGET_FILE"; then
  echo "Patching $TARGET_FILE to fix import error..."
  sed -i 's/from six.moves import _thread/import _thread/' "$TARGET_FILE"
else
  echo "No patch needed for $TARGET_FILE"
fi
