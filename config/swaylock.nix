{ config, pkgs, ... }:

{
  programs.swaylock = {
    enable = true;
    package = pkgs.swaylock-effects;

    settings = {
      screenshots = true;
      effect-blur = "8x5";
      fade-in = 0.2;

      # Clock
      clock = true;
      timestr = "%-I:%M %p";
      datestr = "%A, %d %B";

      # Typography (macOS-ish)
      font = "Inter";
      font-size = 50;

      # Layout / indicator
      indicator = true;
      indicator-radius = 140;
      indicator-thickness = 6;

      # Clean transparent style
      inside-color = "00000000";
      ring-color = "ffffff33";
      line-color = "00000000";
      separator-color = "00000000";

      text-color = "ffffffff";
      key-hl-color = "a6da95";
      bs-hl-color = "ee99a0";

      # Cleaner messages
      text-clear = "";
      text-ver = "";
      text-wrong = "Wrong password";
      text-caps-lock = "Caps Lock";

      show-failed-attempts = true;
    };
  };
}
