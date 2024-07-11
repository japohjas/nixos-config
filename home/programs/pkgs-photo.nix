{ pkgs, ... }: 

{
  home.packages = (with pkgs; [ 
    gimp-with-plugins
    gthumb
    digikam
    exiftool
    rawtherapee
  ]);