## MY personal NixOS Configuration.
```htm
My personal NixOS flake places the configuration in
~/nixos-config

Home Manager as a module of NixOS

Computers:
nuc8i5  (Intel i5-8259U, ram 32G)
acer-v3  (Intel i3-3110m, ram 16G)
toshiba-l300  (Intel 585, ram 4G)

```
### Install NixOS (Gnome, Xfce4, 64-bit Intel/AMD)
### [NixOS download](https://nixos.org/download/)

### Manually modify the /etc/nixos/configuration.nix
```htm
{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Add noatime - do not update inode access times on the filesystem. Can help performance.
  fileSystems."/" = { 
    options = [ "noatime" ];
  };

  # Limit the number of generations to keep, set boot timeout to 3s.
  boot.loader.systemd-boot.configurationLimit = 5;
  # boot.loader.grub.configurationLimit = 5;
  boot.loader.timeout = 3;

  # Change your hostname. (E.g "<pc-name>" -> "nuc8i5")
  networking.hostName = "<pc-name>"; # Define your hostname.
  # ......  

  # Enable the Flakes feature and the accompanying new nix command-line tool
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Add pkgs
  environment.systemPackages = with pkgs; [
    # Flakes clones its dependencies through the git command,
    # so git must be installed first
    git
    vim
    wget
    curl
    sbctl # lanzaboote. To create Secure Boot keys, we use sbctl
  ];

  # Set the default editor to vim
  environment.variables.EDITOR = "vim";

  # Enable services. E.g
  services.fstrim.enable = true;
  services.flatpak.enable = true;
  # ......
}
```
### After making these changes, run:
```console
sudo nixos-rebuild switch
reboot
```

### Copy files: configuration.nix and hardware-configuration.nix to https://github.com/japohjas/nixos-config


### Clone nixos-config:
```console
git clone https://github.com/japohjas/nixos-config.git
```

### Please check the following:
```htm
~/.nixos-config/hosts/<pc-name>/cofiguration.nix
  networking.hostName = "<pc-name>";

~/.nixos-config/flake.nix
  nixosConfigurations
    <pc-name> = nixpkgs.lib.nixosSystem 
      ...
      home-manager.users.<your-name> = import ./home/<pc-name>-home.nix;   

~/.nixos-config/home/<pc-name>-home.nix
  home.username = "<your-name>";
  home.homeDirectory = "/home/<your-name>";
```

### Updating the system:
```console
cd ~/nixos-config

# Update flake.lock
nix flake update

# Or replace only the specific input, such as home-manager:
nix flake lock --update-input home-manager

# Apply the updates
sudo nixos-rebuild switch --flake .
```

### Add secureboot (read):
```htm
modules/securboot/README.md
```


### [NixOS & Flakes Book. An unofficial book for beginners](https://nixos-and-flakes.thiscute.world/)
