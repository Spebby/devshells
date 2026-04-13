{ pkgs, ... }:
{
  rust = pkgs.buildEnv {
    name = "lang-rust";
    paths = with pkgs; [
      rustc
      cargo
      rustfmt
      clippy
      rust-analyzer
      gcc
    ];
  };
}
