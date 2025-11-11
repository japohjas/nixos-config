{ pkgs, ... }: 

{
  home.packages = with pkgs; [ 
    gnome-disk-utility
    mate.mate-calc

    # mate.atril # a PDF viewer
    # xfce.ristretto # Fast and lightweight picture-viewer
    # cinnamon.xviewer # an image viewer based on Eye of GNOME
    # xed-editor # a text editor
  ];
}  