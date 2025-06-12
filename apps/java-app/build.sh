
#!/bin/bash

set -e

echo "📦 Building Java Maven project..."
current_dir=$(pwd)

cd "$current_dir"  # Ensure script runs from its own directory
mvn clean install

echo "✅ Java build complete!"
