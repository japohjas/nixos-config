{ config, pkgs, ... }: 

{
  home.packages = [
    pkgs.conky
  ];

  home.file = {
    ".config/conky" = {
      source = ./conky-config;
      # copy the scripts directory recursively
      recursive = true;
    };
  };

  home.file.".config/autostart/conky.desktop" = {
    text = ''
      [Desktop Entry]
      Type=Application
      Name=conky
      Exec=conky --daemonize --pause=20
      StartupNotify=false
      Terminal=false
    '';
    recursive = true;
  };  
}