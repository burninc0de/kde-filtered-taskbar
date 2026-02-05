#!/bin/bash

# Filtered Taskbar Installation Script

set -e

WIDGET_ID="org.kde.plasma.filtered.taskbar"
WIDGET_DIR="$HOME/.local/share/plasma/plasmoids/$WIDGET_ID"

echo "Installing Filtered Taskbar widget..."

# Create plasmoids directory if it doesn't exist
mkdir -p "$HOME/.local/share/plasma/plasmoids"

# Copy widget files
cp -r "$WIDGET_ID" "$WIDGET_DIR"

echo "Widget installed to $WIDGET_DIR"

# Install with plasmoid tool
if command -v plasmapkg2 &> /dev/null; then
    echo "Registering widget with Plasma..."
    plasmapkg2 -i "$WIDGET_ID" 2>/dev/null || true
fi

echo "Restarting Plasma shell..."
plasmashell --replace &

echo "Installation complete!"
echo ""
echo "To add the widget:"
echo "1. Right-click on your panel"
echo "2. Select 'Add Widgets...'"
echo "3. Find 'Filtered Taskbar' in the list"
echo "4. Drag it to your panel"
echo ""
echo "Configure filtering in widget settings (right-click → Configure Filtered Taskbar → Applications tab)"