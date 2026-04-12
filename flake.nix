{
  description = "Language toolchain bundles and devshells";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        tree = import ./modules {
          inherit pkgs;
          inherit (pkgs) lib;
        };

        lang = tree.provides;
      in
      {
        packages = lang.packages // {
          default = lang.packages."lang-full";
        };
        devShells = lang.devShells // {
          default = lang.devShells."lang-full";
        };
      }
    );
}
