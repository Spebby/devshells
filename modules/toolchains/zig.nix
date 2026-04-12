{ pkgs, ... }:
{
  zig = pkgs.buildEnv {
    name = "lang-zig";
    paths = with pkgs; [
      zig
      zls
    ];
  };
}
