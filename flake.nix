{
  description = "home manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager }:
    let
      system = "x86_64-linux";
    in {
      homeConfigurations."bryan" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          {
            home.username = "bryan";
            home.homeDirectory = "/home/bryan";
            home.stateVersion = "24.05";
          }

          {
            home.packages = with nixpkgs.legacyPackages.${system};
            [
              uv
              unzip
            ];
            home.sessionPath = [
              "HOME/.local/bin"
            ];
          }

          ./modules/kitty.nix
        ];
      };
    };
}