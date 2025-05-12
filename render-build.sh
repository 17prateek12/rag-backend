#!/usr/bin/env bash
echo "🔍 Scanning for broken 'from six.moves import _thread' imports..."

# Find and patch all occurrences in .venv
FILES=$(grep -rl "from six.moves import _thread" .venv)

if [ -z "$FILES" ]; then
  echo "✅ No problematic imports found. Nothing to patch."
else
  for file in $FILES; do
    echo "⚙️  Patching $file"
    sed -i 's/from six.moves import _thread/import _thread/' "$file"
  done
  echo "✅ All problematic imports patched."
fi
