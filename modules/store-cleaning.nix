{ lib, pkgs, ... }:

{
  # do garbage collection weekly to keep disk usage low
  nix.gc = {
    automatic = lib.mkDefault true;
    dates = lib.mkDefault "weekly";
    options = lib.mkDefault "--delete-older-than 7d";
  };

  # Manual optimise storage: nix-store --optimise
  # https://nixos.org/manual/nix/stable/command-ref/conf-file.html#conf-auto-optimise-store
  nix.settings.auto-optimise-store = true;

  # remove nix-channel related tools & configs, we use flakes instead.
  # seuraavat virheilmoitukset nix-channel poistosta.
  # warning: /root/.nix-defexpr/channels exists, but channels have been disabled.
  # warning: /nix/var/nix/profiles/per-user/root/channels exists, but channels have been disabled.
  # warning: /root/.nix-defexpr/channels exists, but channels have been disabled.
  # nix.channel.enable = false;
}