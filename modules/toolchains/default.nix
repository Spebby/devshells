{ pkgs, lib, ... }:
let
  baseIncludes = [
    (import ./c.nix { inherit pkgs lib; })
    (import ./cpp.nix { inherit pkgs lib; })
    (import ./rust.nix { inherit pkgs lib; })
    (import ./zig.nix { inherit pkgs lib; })
    (import ./csharp.nix { inherit pkgs lib; })
    (import ./js-ts.nix { inherit pkgs lib; })
    (import ./python.nix { inherit pkgs lib; })
    (import ./odin.nix { inherit pkgs lib; })
  ];

  base = lib.foldl' lib.recursiveUpdate { } baseIncludes;

  full = import ./full.nix {
    inherit pkgs;
    lang = base;
  };
in
base // full
