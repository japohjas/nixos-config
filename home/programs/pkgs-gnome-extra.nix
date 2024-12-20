{ pkgs, ... }: 

{
  home.packages = with pkgs; [ 
    # gnomeExtensions.dash-to-dock
    # gnomeExtensions.gsconnect
    # gnomeExtensions.mpris-indicator-button
    # gnome.gnome-tweaks  # theming
    gnomeExtensions.dash-to-panel
    gnomeExtensions.dash-to-dock
    # gnomeExtensions.arcmenu
    gnomeExtensions.caffeine
    gnomeExtensions.workspaces-indicator-by-open-apps
    gnomeExtensions.space-bar
    gnomeExtensions.blur-my-shell
    # gnomeExtensions.brightness-control-using-ddcutil # ei toimi
    # ddcutil
  ];
}  