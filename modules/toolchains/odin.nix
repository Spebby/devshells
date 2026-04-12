{ pkgs, ... }:
{
  odin = pkgs.buildEnv {
    name = "lang-odin";
    paths = with pkgs; [
      odin
      ols
    ];
  };
}
