{ pkgs, lib, ... }:
let
  lang = import ./toolchains { inherit pkgs lib; };
  mkShell = pkg: pkgs.mkShellNoCC { packages = [ pkg ]; };
in
{
  devShells = {
    "lang-c" = mkShell lang.c;
    "lang-cpp" = mkShell lang.cpp;
    "lang-rust" = mkShell lang.rust;
    "lang-zig" = mkShell lang.zig;
    "lang-csharp" = mkShell lang.csharp;
    "lang-js-ts" = mkShell lang.jsTs;
    "lang-python" = mkShell lang.python;
    "lang-odin" = mkShell lang.odin;
    "lang-full" = mkShell lang.full;
  };
}
