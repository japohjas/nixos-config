{ config, pkgs, ... }: 

{
  # Simple GTK frontend for the mpv video player
  home.packages = [
    pkgs.celluloid
  ];

  home.file.".config/mpv" = {
    source = ./mpv-configs;
    recursive = true;
  }; 
}