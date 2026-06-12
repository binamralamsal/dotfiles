# NixOS Configuration
<img width="1920" height="1080" alt="Layout" src="https://github.com/user-attachments/assets/d71a186c-d21c-4f43-8053-a08651598556" />
A modular, reproducible NixOS configuration powered by flakes, Home Manager, and Hyprland.
This repository contains my personal desktop and development environment with a focus on a clean workflow, modern Wayland tooling, and declarative configuration.

## Features
- Flake-based NixOS configuration
- Modular system structure
- Home Manager integration
- Hyprland Wayland desktop
- Reproducible development environment
- Declarative shell, terminal, browser, and desktop configuration
- PostgreSQL, MariaDB, and Redis services
- Flatpak support

## Desktop Overview
| Component | Application |
|------------|-------------|
| Window Manager | Hyprland |
| Terminal | Ghostty |
| Shell | Zsh |
| Prompt | Starship |
| Launcher | Vicinae |
| Bar | Waybar |
| Notification Center | SwayNC |
| OSD | SwayOSD |
| Lock Screen | Hyprlock |
| Wallpaper Manager | Hyprpaper |
| Browser | Firefox + Helium |
| File Manager | Nautilus |
| Clipboard History | Vicinae |
| Screenshot Tool | Grim + Slurp + Swappy |
| Input Method | IBus + Mozc |

## Development Environment
| Category | Tools |
|----------|-------|
| Editor | Neovim, VS Code |
| Compiler | GCC |
| Languages | Python, Rust, Lua, JavaScript/TypeScript |
| Node.js | FNM |
| Runtime | Bun |
| Rust | rustup |
| Git | Git, GitHub CLI |
| Databases | PostgreSQL, MariaDB, Redis |

## CLI Utilities
| Tool | Purpose |
|------|---------|
| Eza | Modern `ls` replacement |
| Bat | Better `cat` |
| FZF | Fuzzy finder |
| Zoxide | Smarter `cd` |
| Ripgrep | Fast searching |
| FD | Fast file finder |
| Yazi | Terminal file manager |
| Lazygit | Git UI |

## Repository Structure
```txt
├── assets/                     # Wallpapers and static assets
├── config/
│   ├── hypr/                  # Hyprland + Hyprpaper config
│   ├── waybar/                # Waybar configuration
│   ├── scripts/               # Volume, brightness, workspace scripts
│   ├── firefox.nix
│   ├── ghostty.nix
│   ├── git.nix
│   └── zsh.nix
├── modules/
│   ├── system.nix             # Core system configuration
│   ├── packages.nix           # Packages, dev tools, services
│   └── flatpak.nix            # Flatpak setup
├── configuration.nix          # Main system configuration
├── hardware-configuration.nix # Hardware-specific config
├── home.nix                   # Home Manager entrypoint
└── flake.nix                  # Flake definition
```

## Installation
Clone the repository:
```bash
git clone https://github.com/yourusername/dotfiles.git
cd dotfiles
```
Rebuild the system:
```bash
sudo nixos-rebuild switch --flake .#binamra
```

## Hardware Configuration
`hardware-configuration.nix` is machine-specific and should be regenerated for your hardware.
Generate a new hardware configuration:
```bash
sudo nixos-generate-config --show-hardware-config > hardware-configuration.nix
```
Or generate directly into `/etc/nixos`:
```bash
sudo nixos-generate-config
```
If using this repository on another machine:
1. Generate a new hardware configuration
2. Replace `hardware-configuration.nix`
3. Rebuild the system
```bash
sudo nixos-rebuild switch --flake .#binamra
```

## System Workflow

### Rebuild
```bash
sudo nixos-rebuild switch --flake .#binamra
```

### Update inputs
```bash
nix flake update
```
Apply updates:
```bash
sudo nixos-rebuild switch --flake .#binamra
```

### Garbage collection
```bash
nix-collect-garbage -d
```

## Customization
Before using this configuration, you will likely want to update:
- Username
- Hostname
- Git identity
- Display configuration
- Hardware configuration
- Browser preferences
- Package selection

## License
MIT
