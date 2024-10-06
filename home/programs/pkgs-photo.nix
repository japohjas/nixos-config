{ pkgs, ... }: 

# Siirretty flathubiin:
# gimp, rawtherapee
{
  home.packages = with pkgs; [
    gthumb
    digikam
    exiftool
    # gimp-with-plugins
    # rawtherapee
  ];
}