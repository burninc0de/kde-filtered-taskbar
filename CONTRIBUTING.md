# Contributing to Filtered Taskbar

Thank you for your interest in contributing to the Filtered Taskbar widget! This document provides guidelines for contributing.

## Development Setup

1. **Prerequisites:**
   - KDE Plasma 6
   - Qt 6.6+
   - Development tools (git, etc.)

2. **Installation for Development:**
   ```bash
   git clone <repository-url>
   cd filtered-taskbar
   # Copy to plasmoids directory
   cp -r . ~/.local/share/plasma/plasmoids/org.kde.plasma.filtered.taskbar
   # Restart Plasma
   plasmashell --replace &
   ```

3. **Testing:**
   - Add the widget to your panel
   - Test filtering with different applications
   - Verify cross-user compatibility

## Code Style

- Follow KDE coding standards
- Use SPDX license headers on all source files
- Format QML files with `qmlformat`
- Use meaningful commit messages

## Submitting Changes

1. Fork the repository
2. Create a feature branch: `git checkout -b feature/your-feature`
3. Make your changes
4. Test thoroughly
5. Commit with clear messages
6. Push to your fork
7. Submit a pull request

## Reporting Issues

When reporting bugs, please include:
- KDE Plasma version
- Qt version
- Steps to reproduce
- Expected vs actual behavior
- Any relevant logs

## License

By contributing, you agree that your contributions will be licensed under the same GPL-2.0-or-later license as the project.