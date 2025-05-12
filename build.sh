#!/usr/bin/env bash

echo "Running build.sh: patching newspaper3k/_thread issue"

# Find the tz.py file inside the dateutil module
TARGET_FILE=$(find server -type f -path "*/dateutil/tz/tz.py" | head -n 1)

if [ -n "$TARGET_FILE" ]; then
  echo "Found tz.py at $TARGET_FILE"
  sed -i 's/from six.moves import _thread/import _thread/' "$TARGET_FILE"
  echo "Patched $TARGET_FILE"
else
  echo "tz.py not found. Skipping patch."
fi
