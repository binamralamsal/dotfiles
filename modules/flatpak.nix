{
  services.flatpak = {
    enable = true;

    packages = [
        "io.github.ppvan.tarug"
    ];

    update.onActivation = true;
  };
}
