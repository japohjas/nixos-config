{ config, ... }:

{
  # https://nixos-and-flakes.thiscute.world/nixos-with-flakes/nixos-flake-configuration-explained
  
  home.file.".nixos-update-github" = {
    text = ''
      echo "NixOS päivitys käynnistetty github:n kautta..."
      echo ""
      echo "nixos-rebuild switch --flake github:japohjas/nixos-config"
      sudo nixos-rebuild switch --flake github:japohjas/nixos-config
      sudo -k
      echo "sudo -k"
      echo "Poistettu sudo oikeudet"
      echo ""
      echo "flatpak update -y"
      flatpak update -y
      echo ""
      echo "pipx upgrade yle-dl"
      pipx upgrade yle-dl
      echo ""
      echo "Viimeistele päivitys käynnistämällä kone uudestaan."
    '';
    executable = true;
    recursive = true;
  };
}