{ pkgs, ... }: 

{
  home.packages = with pkgs; [ 
    gnome.gnome-tweaks  # theming
    gnomeExtensions.dash-to-panel
    gnomeExtensions.arcmenu
    gnomeExtensions.caffeine
    gnomeExtensions.workspaces-indicator-by-open-apps
    gnomeExtensions.space-bar
    gnomeExtensions.blur-my-shell
  ];
}