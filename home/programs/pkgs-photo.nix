{ pkgs, ... }: 

# Siirretty flathubiin:
# digikam, gimp, rawtherapee
{
  home.packages = with pkgs; [ 
    gimp-with-plugins
    gthumb
    digikam
    exiftool
    rawtherapee
  ];
}