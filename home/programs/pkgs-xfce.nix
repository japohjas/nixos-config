{ pkgs, ... }: 

{
  home.packages = with pkgs; [ 
    gnome.gnome-disk-utility
    gnome.gnome-calculator

    cinnamon.xreader # a PDF viewer
    cinnamon.pix # a photo organization application based on gThumb
    # cinnamon.xviewer # an image viewer based on Eye of GNOME
    # xed-editor # a text editor
  ];
}  