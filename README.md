# Devshells

A collection of devshells/language toolchains I use.
Wrote it all out here to streamline setting up future devshells :)

The following packages are provided for Linux, Darwin (x86_64/aarch64)

- lang-c
- lang-cpp
- lang-csharp
- lang-js-ts
- lang-odin
- lang-python
- lang-rust
- lang-zig
- lang-full

## Minimum Flake

```nix
{
  description = "Minimum flake (with flake-utils)";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    devshells = {
      url = "github:Spebby/devshells";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    {
      nixpkgs,
      flake-utils,
      devshells,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (system: {
      devShells.default = nixpkgs.legacyPackages.${system}.mkShell {
        packages = [ devshells.packages.${system}."lang-rust" ];
      };
    });
}
```

```nix
{
  description = "Minimum flake (without flake-utils)";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    devshells = {
      url = "github:Spebby/devshells";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { nixpkgs, devshells, ... }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forEachSystem = f: nixpkgs.lib.genAttrs systems (system: f system);
    in
    {
      devShells = forEachSystem (system: {
        default = nixpkgs.legacyPackages.${system}.mkShell {
          packages = [ devshells.packages.${system}."lang-rust" ];
        };
      });
    };
}
```
