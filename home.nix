{ config, pkgs, ... }:
let
  dotfiles = "${config.home.homeDirectory}/dotfiles/config";
  symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    hypr = "hypr";
    waybar = "waybar";
    vicinae = "vicinae";
  };
in
{
  home.username = "binamra";
  home.homeDirectory = "/home/binamra";
  home.sessionVariables = {
    LD_LIBRARY_PATH = "/run/current-system/sw/share/nix-ld/lib";
    QT_QPA_PLATFORMTHEME = "gtk3";
    QT_QPA_PLATFORM = "wayland";
    ALSA_PLUGIN_DIR = "${pkgs.pipewire}/lib/alsa-lib";
  };

  systemd.user.sessionVariables = {
    ALSA_PLUGIN_DIR = "${pkgs.pipewire}/lib/alsa-lib";
  };

  imports = [
    ./config/zsh.nix
    ./config/git.nix
    ./config/ghostty.nix
    ./config/swaylock.nix
    ./config/tmux.nix
  ];

  xdg.configFile = builtins.mapAttrs (_: subpath: {
    source = symlink "${dotfiles}/${subpath}";
  }) configs;


  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;

    package = pkgs.phinger-cursors;
    name = "phinger-cursors-dark";
    size = 24;
  };

  services.ssh-agent.enable = true;

  # gtk
  gtk = {
    enable = true;
  
    theme = {
      name = "Adwaita-dark";
      package = pkgs.gnome-themes-extra;
    };
  
    gtk4 = {
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
    };
  };  

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
  };
  
  home.stateVersion = "26.05";
}
