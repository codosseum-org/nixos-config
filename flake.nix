{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    nixconfig.url = "github:bristermitten/nix-dotfiles";
    nixconfig.inputs.nixpkgs.follows = "nixpkgs";

    sandkasten.url = "github:Defelo/sandkasten/latest";
  };

  outputs = { self, nixconfig, nixpkgs, sandkasten, ... }@inputs:
   let
      # Define the system (adjust as needed)
      system = "x86_64-linux";

      # Create pkgs for the system
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {

      inherit (nixconfig) packages formatter;
      nixosConfigurations.vmi2319146 = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {inherit sandkasten; inherit pkgs; };

        modules = [ 
nixconfig.nixosConfigurations.vmi2319146.config
        ./sandkasten.nix
        ];
      };

    };

}
