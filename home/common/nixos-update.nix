{ config, ... }:

{
  home.file.".nixos-update" = {
    text = ''
      echo "NixOS päivitys käynnistetty..."
      echo ""

      echo "nix flake update ~/nixos-config"
      nix flake update ~/nixos-config

      echo "nixos-rebuild switch --flake ~/nixos-config"
      sudo nixos-rebuild switch --flake ~/nixos-config
  
      echo "sudo -k"
      sudo -k
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
 