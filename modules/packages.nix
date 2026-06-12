{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    # =========================
    # Core / System utilities
    # =========================
    wget
    curl
    unzip
    zip
    tree
    file
    killall
    nwg-look
    pamixer
    brightnessctl
    libnotify
    networkmanagerapplet
    stdenv.cc.cc
    ffmpegthumbnailer
    gst_all_1.gst-libav
    xdg-user-dirs
    pavucontrol

    # =========================
    # Terminal / CLI tools
    # =========================
    starship
    eza
    bat
    fzf
    zoxide
    yazi
    jq
    ripgrep
    fd

    # =========================
    # Monitoring / debugging
    # =========================
    htop
    btop

    # =========================
    # Development
    # =========================
    gcc
    neovim
    lazygit
    python315
    fnm
    bun
    nixfmt
    lua-language-server
    rustup

    # =========================
    # Hyprland / Wayland
    # =========================
    waybar
    hyprpaper
    swaynotificationcenter
    swayosd
    vicinae
    wlogout
    hyprcursor
    hyprpicker
    hypridle
    hyprlock

    # screenshots / clipboard
    wl-clipboard
    hyprshot
    satty

    # =========================
    # GUI Applications
    # =========================
    vscode
    telegram-desktop
    qbittorrent
    foliate
    obs-studio
    anydesk
    appimage-run
    inputs.helium-flake.packages.${pkgs.stdenv.hostPlatform.system}.helium
    video-trimmer
    proton-vpn
    calibre
    gnome-epub-thumbnailer
    nautilus
    gnome-themes-extra
    loupe
    p7zip
    wireguard-tools
    cine
    resources
    paper-clip
  ];

  programs.zsh.enable = true;
  programs.nm-applet.enable = true;
  programs.nix-ld.enable = true;
  programs.dconf.enable = true;
  services.cloudflare-warp.enable = true;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    libre-baskerville
  ];

  services.redis.servers.default = {
    enable = true;
    port = 6379;
  };

  services.postgresql = {
    enable = true;
    enableTCPIP = true;

    ensureDatabases = [ "binamra" ];

    authentication = pkgs.lib.mkOverride 10 ''
      local all all trust
      host all all 127.0.0.1/32 scram-sha-256
      host all all ::1/128 scram-sha-256
    '';

    ensureUsers = [
      {
        name = "binamra";
        ensureDBOwnership = true;

        ensureClauses = {
          login = true;
          superuser = true;
          createdb = true;
          createrole = true;

          password = "SCRAM-SHA-256$4096:eTz+mvODp/4SGRmCWFV37w==$KVWAGUXd/Y1X0EupY1peVXrhUq/KM7a1ZVXolCnLHbc=:Jwtzd8byds0osVBCnpu66QlrGAqBU5jtqHfXWGl752s=";
        };
      }
    ];
  };

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;

    initialScript = pkgs.writeText "mysql-init.sql" ''
      CREATE DATABASE IF NOT EXISTS binamra;

      CREATE USER IF NOT EXISTS 'binamra'@'localhost'
      IDENTIFIED BY '1234';

      GRANT ALL PRIVILEGES
      ON *.*
      TO 'binamra'@'localhost'
      WITH GRANT OPTION;

      FLUSH PRIVILEGES;
    '';
  };

  services.meilisearch.enable = true;
}
