{ pkgs, ... }:
{
  python = pkgs.buildEnv {
    name = "lang-python";
    paths = with pkgs; [
      python311
      pyright
      ruff
    ];
  };
}
