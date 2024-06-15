{ pkgs, ... }: 

{
  imports = [
    ./conky
    ./celluloid
  ];
  
  home.packages = (with pkgs; [ 
    neofetch
    nnn      	# terminal file manager
    w_scan
    libreelec-dvb-firmware
    ffmpeg-full
    pipx      # pipx install yle-dl
    btop      # replacement of htop/nmon
    
    firefox
    chromium
    
    gimp-with-plugins
    gthumb
    digikam
    exiftool
    rawtherapee
    
    # system tools
    pciutils  # lspci
    usbutils  # lsusb
    
    aspellDicts.fi      # Aspell dictionary for Finnish, text editor

    dejavu_fonts
    noto-fonts
    noto-fonts-color-emoji
    corefonts           # MS
    # source-code-pro
    # font-awesome      # Icons

    papirus-icon-theme

    gnome.gnome-tweaks  # theming
  ]) ++ (with pkgs.gnomeExtensions; [
    dash-to-panel
    arcmenu
  ]);
}
