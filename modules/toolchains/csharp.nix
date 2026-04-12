{ pkgs, lib, ... }:
{
  csharp = pkgs.buildEnv {
    name = "lang-csharp";
    paths =
      with pkgs;
      [
        dotnet-sdk_8
        dotnet-runtime_8
        dotnet-aspnetcore_8
      ]
      ++ lib.optionals pkgs.stdenv.isLinux [
        omnisharp-roslyn
        mono
      ];
  };
}
