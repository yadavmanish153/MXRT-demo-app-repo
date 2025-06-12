#!/bin/bash

set -e

echo "📦 Building python project..."

cd "$(dirname "$0")"  # Ensure script runs from its own directory
pip install -r requirements.txt

echo "✅ Python build complete!"
