
## NixOS Secure Boot - lanzaboote
### Computer:
```htm
nuc815 UEFI

systemd-boot
```
### Creating your keys:
```console
sudo sbctl create-keys
```

### Remove unmarks:
```htm
~/nixos-config/flake.nix

  active lanzaboot:
    inputs
    outputs

  modules = [
    ...
    lanzaboote.nixosModules.lanzaboote
    ./nixos/secureboot
    ... 
  ]
```

### Updating the system:
```console
cd nixos-config
sudo nixos-rebuil switch --flake .
```

### Go to the bios menu, intel nuc8i5 (F2):
```htm
Advanced
select boot
select Secure boot
Mark the following:
  Secure boot x
  Clear Secure Boot data x
F10 (save and exit)
```

### Enrolling Keys:
```console
sudo sbctl enroll-keys --microsoft
reboot
```

### Check Secure Boot:
```console
bootctl status
```
```htm
System:
      Firmware: UEFI 2.70 (American Megatrends 5.13)
 Firmware Arch: x64
   Secure Boot: enabled (user)
  TPM2 Support: yes
  Boot into FW: supported

```

### [Quick Start: NixOS Secure Boot](https://github.com/nix-community/lanzaboote/blob/master/docs/QUICK_START.md)

