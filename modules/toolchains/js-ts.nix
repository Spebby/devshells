{ pkgs, ... }:
{
  jsTs = pkgs.buildEnv {
    name = "lang-js-ts";
    paths = with pkgs; [
      nodejs
      typescript
      typescript-language-server
      eslint
      prettier
      yarn
      pnpm
    ];
  };
}
