{
  description = "NixOS configuration, Jari Pohjasmäki";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

     lanzaboote = {
       url = "github:nix-community/lanzaboote/v0.4.3";
       inputs.nixpkgs.follows = "nixpkgs";
     };

     nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = inputs@ { 
    nixpkgs,
    home-manager,
    lanzaboote,
    nixos-hardware,
    ...
  }:

  let
    system = "x86_64-linux";
  in

  {
    nixosConfigurations = {
      nuc8i5 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          lanzaboote.nixosModules.lanzaboote
          nixos-hardware.nixosModules.common-cpu-intel
          ./hosts/nuc8i5
          ./modules/secureboot
          
          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.jari = import ./home/nuc8i5-home.nix;
          }
        ];
      };

      toshiba-l300 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          nixos-hardware.nixosModules.common-cpu-intel
          ./hosts/toshiba-l300
          
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.helmi = import ./home/toshiba-l300-home.nix;
          }
        ];
      };  

      acer-v3 = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          # lanzaboote.nixosModules.lanzaboote
          # ./modules/secureboot
          nixos-hardware.nixosModules.common-cpu-intel
          ./hosts/acer-v3
        
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.paivi = import ./home/acer-v3-home.nix;
          }
        ];
      };
    };
  };
}

