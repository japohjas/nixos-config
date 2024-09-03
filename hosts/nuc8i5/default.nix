{ lib, pkgs, ... }:

{
    imports = [
      ./configuration.nix
      # ../../modules/gpu-intel.nix
      ../../modules/zram.nix
      ../../modules/store-cleaning.nix
      ../../modules/second-hd-nuc8i5.nix
    ];

  # intel i5-8259U - Coffee Lake - Q2'18 - Intel Iris Plus Graphics 655 - 8th Generation
  # ram 32 G
  # zramSwap = { memoryPercent = lib.mkForce 25; };

  # You can test your configuration by running: nix-shell -p libva-utils --run vainfo
  #hardware.opengl.extraPackages = [
  #  pkgs.intel-media-driver # LIBVA_DRIVER_NAME=iHD
  #];

  # Force intel-media-driver - switch to nixos-hardware.nixosModules.common-cpu-intel
  # environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };

  # Linux thermal daemon monitors and controls temperature in laptops, 
  # tablets PC with the latest Intel sandy bridge (Q3'11 2nd generation) and latest Intel CPU releases.
  # Once the system temperature reaches a certain threshold,
  # the Linux daemon activates various cooling methods to try to cool the system.
  services.thermald.enable = lib.mkDefault true;

  # Allows for updating firmware via `fwupdmgr`.
  # $ fwupdmgr get-devices
  services.fwupd.enable = true;
}