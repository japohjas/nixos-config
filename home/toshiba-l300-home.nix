{ config, pkgs, ... }:

{
  imports = [
    ./programs/pkgs.nix
    ./programs/pkgs-xfce.nix
    ./programs/conky
    ./programs/celluloid
    ./common/nixos-update.nix
    ./common/nixos-update-github.nix
  ];

  home.username = "helmi";
  home.homeDirectory = "/home/helmi";

  # pipx, yle-dl path
  # export PATH="$PATH:/home/helmi/.local/bin"
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:/home/helmi/.local/bin"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      up-nix="./.nixos-update";
      # up-git="./.nixos-update-github";
    };
  };

  # xfce calendar
  # calendar:indeterminate {color: gray; }
  # calendar.highlight { backg round-color: gray; }
  home.file.".config/gtk-3.0/gtk.css" = {
    text = ''
      calendar { font.size: 18pt; padding: 5px; margin: 5px; }
    '';
    recursive = true;
  };  

  # adjustment-method=wayland
  services.gammastep = {
    enable = true;
    temp-day=6000;
    temp-night=5000;
    provider = "manual";
    latitude = 60.2;
    longitude = 24.9;
  };

  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}