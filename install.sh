#!/bin/bash

# Filtered Taskbar Installation Script

set -e

WIDGET_ID="org.kde.plasma.filtered.taskbar"
WIDGET_DIR="$HOME/.local/share/plasma/plasmoids/$WIDGET_ID"

# Check if running from repository root
if [ ! -d "$WIDGET_ID" ]; then
    echo "Error: $WIDGET_ID directory not found."
    echo "Please run this script from the repository root directory."
    exit 1
fi

echo "Installing Filtered Taskbar widget..."

# Create plasmoids directory if it doesn't exist
mkdir -p "$HOME/.local/share/plasma/plasmoids"

# Remove existing widget if it exists
if [ -d "$WIDGET_DIR" ]; then
    echo "Removing existing widget installation..."
    rm -rf "$WIDGET_DIR"
fi

# Copy widget files
cp -r "$WIDGET_ID" "$WIDGET_DIR"

echo "Restarting Plasma shell to load the widget..."
plasmashell --replace > /dev/null 2>&1 &

echo "Installation complete!"
echo ""
echo "To add the widget:"
echo "1. Right-click on your panel"
echo "2. Select 'Add Widgets...'"
echo "3. Find 'Filtered Taskbar' in the list"
echo "4. Drag it to your panel"
echo ""
echo "Configure filtering in widget settings (right-click → Configure Filtered Taskbar → Applications tab)"