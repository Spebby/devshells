{ pkgs, ... }:
{
  c = pkgs.buildEnv {
    name = "lang-c";
    paths = with pkgs; [
      clang
      cmake
      gnumake
      meson
    ];
  };
}
