{ config, ... }:

{
  home.file.".nixos-update" = {
    text = ''
      echo "NixOS full päivitys käynnistetty..."
      echo ""

      cd ~/nixos-config
      echo "~/nixos-config/git pull"
      git pull
      echo "~/nixos-config/git clean -dfx"
      git clean -dfx
      cd ..
      echo ""

      # echo "nix flake update ~/nixos-config"
      # nix flake update ~/nixos-config

      echo "Deleting all historical versions older than 7 days"
      sudo nix profile wipe-history --older-than 7d --profile /nix/var/nix/profiles/system
      echo ""

      echo "Running garbage collection after wiping history"
      sudo nix-collect-garbage --delete-old
      echo ""

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
 