{
  description = "Laptop NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v0.4.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, lanzaboote, ... }:

  let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
        };
    unstable = import nixpkgs-unstable {
       inherit system; 
       config.allowUnfree = true;
         };

  in {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./configuration.nix
        lanzaboote.nixosModules.lanzaboote
        ./modules/lanzaboote.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = false;
          home-manager.useUserPackages = true;
          home-manager.users.kwebo = ./home-manager/home.nix;
          home-manager.extraSpecialArgs = {
            pkgs = pkgs;
            unstable = unstable;
          };
        }
      ];
    };
  };
}