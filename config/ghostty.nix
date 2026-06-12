{ pkgs, ... }:
{
  programs.ghostty = {
    enable = true;

    settings = {
      theme = "Catppuccin Mocha";

      font-family = "JetBrainsMono Nerd Font";

      background-opacity = 0.8;
      background-blur = true;
    };
  };
}
