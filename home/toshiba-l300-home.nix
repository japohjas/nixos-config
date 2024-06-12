{ config, pkgs, ... }:

{
  imports = [
    ./programs/pkgs.nix
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
      up-git="./.nixos-update-github";
    };
  };

  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}