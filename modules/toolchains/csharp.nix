{ pkgs, ... }: {
  csharp = pkgs.buildEnv {
    name = "lang-csharp";
    paths = with pkgs; [
      dotnet-sdk_8
      msbuild
      omnisharp-roslyn
      mono
    ];
  };
}
