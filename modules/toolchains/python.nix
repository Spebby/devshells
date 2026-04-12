{ pkgs, ... }:
{
  python = pkgs.buildEnv {
    name = "lang-python";
    paths = with pkgs; [
      python313
      pyright
      ruff
    ];
  };
}
