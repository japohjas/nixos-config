{ config, pkgs, ... }:

{
  imports = [
    ./programs/pkgs.nix
    ./programs/pkgs-photo.nix
    ./programs/pkgs-gnome-extra.nix
    # ./programs/conky
    ./programs/celluloid
    ./common/nixos-update-nuc8i5.nix
    # ./common/nixos-update-github.nix
    # ./common/nixos-flake-update.nix
  ];

  home.username = "jari";
  home.homeDirectory = "/home/jari";

  # pipx, yle-dl path
  # export PATH="$PATH:/home/jari/.local/bin"
  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:/home/jari/.local/bin"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      up-nix="./.nixos-update-nuc8i5";
      # up-git="./.nixos-update-github";
    };
  };

  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
