# NixOS System Configuration

This repository contains a modular NixOS system configuration managed as a Nix flake. It is designed to provide a consistent and feature-rich environment for both desktop and laptop systems.

## Features

This configuration is built around a modular architecture defined in the `features/` directory.

### Core Environment
- **Window Manager**: [Niri](https://github.com/YaLTeR/niri) (Scrollable Tiling Wayland Compositor).
- **Shell & UI**: [Noctalia Shell](https://github.com/noctalia-dev/noctalia-shell) integration for bars, notifications, app launching, and system controls.
- **Theming**: System-wide styling using [Stylix](https://github.com/nix-community/stylix).

### Applications & Development
- **Browser**: [Zen Browser](https://zen-browser.app/).
- **Development**:
  - `devenv` support.
  - Languages: Python, C/C++ (via CLion/tools).
  - Tools: Helix (editor), Direnv, LazyGit, Ripgrep, Nixd/Nil (LSP).
  - IDE: JetBrains CLion.
- **Gaming**: Steam, Bottles, Protontricks, ProtonUp-Qt.
- **Tools**: Obsidian, Discord, VLC, Nautilus.

### Hardware & Networking
- **Nvidia**: Dedicated configuration for Nvidia drivers.
- **VPN**: Integrated VPN setup (OpenVPN3).
- **Virtualization**: Podman (Docker compatible) and Distrobox.

## Directory Structure

```
.
├── flake.nix             # Flake entry point & inputs
├── nixos/                # Host-specific configurations
│   ├── desktop/          # Desktop configuration entry
│   └── laptop/           # Laptop configuration entry
├── home-manager/         # Base Home Manager configuration
└── features/             # Modular feature definitions
    ├── apps/             # User applications (Flatpak, Zen, Obsidian...)
    ├── development/      # Dev tools (git, helix, direnv...)
    ├── gaming/           # Steam & gaming tools
    ├── niri/             # Window manager configuration
    ├── noctalia/         # Noctalia Shell integration
    ├── nvidia/           # Graphics drivers
    ├── stylix/           # Theming
    └── ...
```

## Usage

This configuration requires a system with Nix installed and Flakes enabled.

### Available Hosts

- **desktop**: Workstation configuration.
- **laptop**: Portable configuration with battery/power management optimizations.

### Applying Configuration

To switch to the **desktop** configuration:

```bash
sudo nixos-rebuild switch --flake .#desktop
```

To switch to the **laptop** configuration:

```bash
sudo nixos-rebuild switch --flake .#laptop
```

## User Configuration

The system is configured for the user `niko` by default. User-specific settings (username, email, dotfiles location) are defined in the `userSettings` block within `flake.nix`.