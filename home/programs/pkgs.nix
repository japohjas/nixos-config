{ pkgs, ... }: 

{
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
  ]);

  # flatpak apps
  # org.videolan.VLC
  # org.kde.kaffeine
  # com.github.unrud.VideoDownloader
  #
  # org.libreoffice.LibreOffice
  # org.libreoffice.LibreOffice.BundledExtension.Voikko
  #
  # com.google.Chrome
  # org.keepassxc.KeePassXC
  #
  # com.visualstudio.code
}
