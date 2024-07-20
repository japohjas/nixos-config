{ config, lib, ... }:

{
  imports = [
    ./configuration.nix
    # ../../modules/gpu-intel.nix
    ../../modules/zram.nix
    ../../modules/store-cleaning.nix
    ../../modules/swapfile.nix
  ];

  # intel 13-3110m - Ivy Bridge - Q2'12 - intel HD Graphics 4000 - 3rd generation
  # ram 16 G
  # zramSwap = { memoryPercent = lib.mkForce 60; };

  # You can test your configuration by running: nix-shell -p libva-utils --run vainfo
  # Force intel-vaapi-driver - switch to nixos-hardware.nixosModules.common-cpu-intel
  # environment.sessionVariables = { LIBVA_DRIVER_NAME = "i965"; };

  # Linux thermal daemon monitors and controls temperature in laptops, 
  # tablets PC with the latest Intel sandy bridge (Q3'11 2nd generation) and latest Intel CPU releases.
  # Once the system temperature reaches a certain threshold,
  # the Linux daemon activates various cooling methods to try to cool the system.
  services.thermald.enable = lib.mkDefault true;
}  