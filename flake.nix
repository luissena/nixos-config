{
  description = "A simple NixOS flake";

  inputs = {
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    stylix.url = "github:danth/stylix";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    nixpkgs,
    home-manager,
    stylix,
    zen-browser,
    ...
  }: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager

          ./hosts
          ./modules
        ];
      };
    };
  };
}
