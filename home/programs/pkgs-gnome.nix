{ pkgs, ... }: 

{
  home.packages = with pkgs; [ 
    gnome.gnome-tweaks  # theming
    gnomeExtensions.dash-to-panel
    gnomeExtensions.arcmenu
    gnomeExtensions.caffeine
    gnomeExtensions.brightness-control-using-ddcutil
  ];
}