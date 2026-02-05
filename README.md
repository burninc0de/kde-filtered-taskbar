# Filtered Taskbar Widget

[![License: GPL v2](https://img.shields.io/badge/License-GPL_v2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html)

A minimal, heavily modified version of the KDE Plasma Task Manager that provides focused application filtering. Shows only specified applications in the taskbar, with always-visible close buttons and clean defaults.

## Tutorial

https://user-images.githubusercontent.com/44199273/545888523-27605b3e-b6a4-4351-908b-668fe04d8a0d.mp4

## About

This widget is based on the KDE Plasma Task Manager by Eike Hein, but has been heavily modified to create a minimal, focused taskbar that filters applications. Key modifications include:

- **Application filtering**: Show only specified apps instead of all open windows
- **Always-visible close buttons**: Quick window closing without hover
- **Clean defaults**: No default launchers, starts showing all apps
- **Simplified configuration**: Removed complex grouping and visual options
- **Streamlined UI**: Minimal settings focused on filtering

The goal is to provide a distraction-free taskbar that shows only the applications you care about.

## Installation

### Quick Install (Recommended)

```bash
./install.sh
```

This will automatically install the widget and restart Plasma.

### Manual Install

1. Copy the `org.kde.plasma.filtered.taskbar` folder to `~/.local/share/plasma/plasmoids/`
2. Run `plasmapkg2 -i org.kde.plasma.filtered.taskbar` or restart Plasma
3. Add the "Filtered Taskbar" widget to your panel

## Features

- **Tab-based interface**: Switch between application windows using tabs
- **Compact mode**: Shows icon + count when many windows are open
- **Configurable filtering**: Choose which applications to display
- **Window detection**: Automatically detects configured application windows
- **Keyboard shortcuts**: Use Meta+Tab to cycle through windows
- **Close buttons**: Close windows directly from the widget

## Application Filtering

This widget supports configurable application filtering to show only specific applications in the task bar.

### Configuration

Right-click the widget → "Configure Filtered Taskbar" → "Applications" tab:

- **Allowed Applications**: Enter application IDs or names separated by commas
- **Leave empty** to show all applications (default behavior)
- **Examples**:
  - `code` - Show only VSCode
  - `firefox,chromium` - Show only web browsers
  - `code,firefox,zed,kitty` - Show development applications

### Filtering Logic

The widget filters applications using multiple detection methods:

```qml
function isApplicationAllowed() {
    // If no allowed applications configured, show all
    if (!Plasmoid.configuration.allowedApplications || 
        Plasmoid.configuration.allowedApplications.length === 0) {
        return true;
    }

    // Parse comma-separated list and check each application
    const allowedApps = Plasmoid.configuration.allowedApplications
        .split(',')
        .map(app => app.trim())
        .filter(app => app.length > 0);

    for (const allowedApp of allowedApps) {
        // Check app ID exact match
        if (allowedApp.toLowerCase() === appId.toLowerCase()) return true;
        // Check app ID contains allowed app
        if (appId.toLowerCase().indexOf(allowedApp.toLowerCase()) !== -1) return true;
        // Check app name contains allowed app
        if (appName.toLowerCase().indexOf(allowedApp.toLowerCase()) !== -1) return true;
    }
    return false;
}

// Apply filtering
visible: model.IsLauncher || (model.IsWindow && isApplicationAllowed())
```

### Common Application IDs

| Application | ID | Example Usage |
|-------------|----|---------------|
| VSCode | `code` | `code` |
| Firefox | `firefox` | `firefox,chromium` |
| Chrome | `google-chrome` | `google-chrome` |
| Kitty Terminal | `kitty` | `kitty,konsole` |
| Zed Editor | `zed` | `zed` |
| Dolphin | `org.kde.dolphin` | `org.kde.dolphin` |

## Configuration

Right-click the widget and select "Configure Filtered Taskbar" to access settings:

- **Applications**: Configure which applications to display
  - Allowed Applications: Comma-separated list of app IDs/names
  - Leave empty to show all applications
- **Appearance**: Tab width, close button visibility, compact mode threshold
- **Behavior**: Auto-restore, middle-click action
- **Shortcuts**: Customize keyboard shortcuts

## Technical Details

This widget uses:
- Qt 6.6+ and QML
- KDE Plasma 6 Framework
- KWin scripting API for window management
- Plasma Framework for integration

## Development

The widget consists of:
- `metadata.json`: Widget metadata
- `contents/ui/main.qml`: Main UI
- `contents/ui/Task.qml`: Individual task component with filtering logic
- `contents/ui/ConfigApplications.qml`: Application filtering configuration UI
- `contents/config/main.xml`: Configuration schema including allowedApplications
- `contents/config/config.qml`: Configuration tabs structure

## Limitations

- Current implementation uses polling for window detection
- D-Bus integration with KWin script needs refinement
- Some features from the specification are not yet implemented

## Future Improvements

- Real-time window monitoring via KWin signals
- Session persistence and restoration
- Enhanced keyboard shortcuts
- Multi-monitor support
- Unsaved changes indicators

## Contributing

Contributions are welcome! Please:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly on KDE Plasma 6
5. Submit a pull request

## License

This project is licensed under the GNU General Public License v2.0 or later - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Based on the KDE Plasma Task Manager
- Thanks to the KDE community for the excellent Plasma framework