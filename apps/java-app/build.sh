
#!/bin/bash

set -e

echo "📦 Building Java Maven project..."
pwd

#cd "$(dirname "$0")"  # Ensure script runs from its own directory
echo "build maven"
mvn clean install

echo "✅ Java build complete!"
