#!/bin/bash

# Script for testing locally against all supported typescript versions.

npm install
# Compile against the minimum possible version (based on language constructs used)
npm run tsc

versions=('3.0' '3.1' '3.2' '3.4' '3.5' '3.6' '3.7' '3.8' '3.9' '4.0' '4.1' '4.2' '4.3')

for version in "${versions[@]}"; do
  echo "================================================================================"
  echo "    typescript@$version"
  echo "================================================================================"
  {
    npm install --no-save typescript@$version && npm run test:only
  } || {
    echo "Error compiling or testing agaist typescript@$version"
    exit 1
  }
done

npm install
