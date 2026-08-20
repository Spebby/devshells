{ pkgs, ... }: {
  csharp = pkgs.buildEnv {
    name = "lang-csharp";
    paths = with pkgs; [
      dotnet-sdk_8
      dotnet-runtime_8
      dotnet-aspnetcore_8
      msbuild
      omnisharp-roslyn
      mono
    ];
  };
}
