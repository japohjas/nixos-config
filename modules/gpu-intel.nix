{ pkgs, ... }:

# not used - switch to nixos-hardware.nixosModules.common-cpu-intel.

{
  boot.initrd.kernelModules = [ "i915" ];

  # https://wiki.nixos.org/wiki/Accelerated_Video_Playback
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # For Broadwell (2015) or newer processors. LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # For older processors. LIBVA_DRIVER_NAME=i965
      libvdpau-va-gl
    ];
  };
}