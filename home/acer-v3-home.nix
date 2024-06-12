{ config, pkgs, ... }:

{
  imports = [
    ./programs/pkgs.nix
    ./common/nixos-update.nix
  ];
  
  home.username = "paivi";
  home.homeDirectory = "/home/paivi";
 
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}