#!/bin/bash

# Setup script for Cursor on Lubuntu
# This script configures Cursor to avoid conflicts with Windows settings

echo "Setting up Cursor for Lubuntu..."

# Create Cursor config directory if it doesn't exist
mkdir -p ~/.config/cursor/User

# Backup existing settings if they exist
if [ -f ~/.config/cursor/User/settings.json ]; then
    echo "Backing up existing settings..."
    cp ~/.config/cursor/User/settings.json ~/.config/cursor/User/settings.json.backup.$(date +%Y%m%d_%H%M%S)
fi

# Copy Lubuntu-specific settings
echo "Installing Lubuntu-specific settings..."
cp cursor-lubuntu-settings.json ~/.config/cursor/User/settings.json

# Set up Git to ignore IDE settings
echo "Configuring Git to ignore IDE settings..."
git add .gitignore
git commit -m "Add IDE settings to .gitignore to prevent conflicts between machines"

echo "Setup complete!"
echo ""
echo "Next steps:"
echo "1. Restart Cursor"
echo "2. Open this project using: cursor ."
echo "3. Or open the workspace file: cursor tensorflow-examples.code-workspace"
echo ""
echo "Your settings are now machine-specific and won't conflict with Windows!"