{ pkgs, lib, ... }:
let
  includes = [
    (import ./packages.nix { inherit pkgs lib; })
    (import ./devshells.nix { inherit pkgs lib; })
  ];

  provides = lib.foldl' lib.recursiveUpdate { } includes;
in
{
  inherit includes provides;
}
