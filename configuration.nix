{ config, pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix

    ./modules/system.nix
    ./modules/packages.nix
    ./modules/flatpak.nix
  ];

  networking.hostName = "binamra";
  time.timeZone = "Asia/Kathmandu";

  i18n.defaultLocale = "en_US.UTF-8";

  users.users.binamra = {
    isNormalUser = true;
    description = "Binamra Lamsal";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.zsh;
  };

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  nix.optimise.automatic = true;

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  nixpkgs.config.allowUnfree = true;

  home-manager.backupFileExtension = "backup";

  system.stateVersion = "26.05";
}
