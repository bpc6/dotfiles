{
  description = "home manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
    }:
    let
      system = "x86_64-linux";
    in
    {
      homeConfigurations."bryan" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [
          {
            home = {
              username = "bryan";
              homeDirectory = "/home/bryan";
              stateVersion = "24.05";

              packages = with nixpkgs.legacyPackages.${system}; [
                uv
                unzip
              ];

              sessionPath = [
                "$HOME/.local/bin"
              ];
            };
          }

          ./modules/bash.nix
          ./modules/direnv.nix
          ./modules/git.nix
          ./modules/kitty.nix
          ./modules/nvim.nix
          ./modules/starship.nix
        ];
      };
    };
}
