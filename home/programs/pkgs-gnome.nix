{ pkgs, ... }: 

{
  home.packages = (with pkgs; [ 
    gnome.gnome-tweaks  # theming
    nomeExtensions.dash-to-panel
    nomeExtensions.arcmenu
  ]);
}