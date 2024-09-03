{ config, lib, ... }:

{
  imports = [
    ./configuration.nix
    # ../../modules/gpu-intel.nix
    ../../modules/zram.nix
    ../../modules/store-cleaning.nix
    ../../modules/swapfile.nix
  ];

  # intel 585 - Merom - Q3'08 
  # ram 4 G
  zramSwap = { memoryPercent = lib.mkForce 100; };

  # You can test your configuration by running: nix-shell -p libva-utils --run vainfo
  # Force intel-vaapi-driver - switch to nixos-hardware.nixosModules.common-cpu-intel
  # environment.sessionVariables = { LIBVA_DRIVER_NAME = "i965"; };

  # Allows for updating firmware via `fwupdmgr`.
  # $ fwupdmgr get-devices
  services.fwupd.enable = true;
}