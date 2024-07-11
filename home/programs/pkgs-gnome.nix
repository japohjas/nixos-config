{ pkgs, ... }: 

{
  home.packages = with pkgs; [ 
    gnome.gnome-tweaks  # theming
    gnomeExtensions.dash-to-panel
    gnomeExtensions.arcmenu
  ];
}