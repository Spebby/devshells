{
  description = "Language toolchain bundles and devshells";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    zig = {
      url = "github:mitchellh/zig-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      flake-utils,
      zig,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        zigpkgs = import zig { inherit system; };

        tree = import ./modules {
          inherit pkgs zigpkgs;
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
