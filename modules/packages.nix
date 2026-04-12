{ pkgs, lib, ... }:
let
  lang = import ./toolchains { inherit pkgs lib; };
in
{
  packages = {
    "lang-c" = lang.c;
    "lang-cpp" = lang.cpp;
    "lang-rust" = lang.rust;
    "lang-zig" = lang.zig;
    "lang-csharp" = lang.csharp;
    "lang-js-ts" = lang.jsTs;
    "lang-python" = lang.python;
    "lang-odin" = lang.odin;
    "lang-full" = lang.full;
  };
}
