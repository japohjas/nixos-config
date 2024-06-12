{ lib, ... }: 

{
  # For debugging and troubleshooting Secure Boot.
  # pkgs.sbctl  # configuration.nix

  boot.loader.systemd-boot.enable = lib.mkForce false;
  boot.lanzaboote = {
    enable = true;
    pkiBundle = "/etc/secureboot";
    configurationLimit = 5;    # Definition values: 10
  };
}
