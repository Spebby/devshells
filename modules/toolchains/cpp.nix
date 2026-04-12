{ pkgs, ... }:
{
  cpp = pkgs.buildEnv {
    name = "lang-cpp";
    paths = with pkgs; [
      gcc
      cmake
      gnumake
      meson
    ];
  };
}
