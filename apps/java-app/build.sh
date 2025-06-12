
#!/bin/bash

set -e

echo "📦 Building Java Maven project..."

cd "$(dirname "$0")"  # Ensure script runs from its own directory
mvn clean install

echo "✅ Java build complete!"
