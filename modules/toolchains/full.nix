{ pkgs, lang, ... }:
{
  full = pkgs.symlinkJoin {
    name = "lang-full";
    paths = [
      lang.c
      lang.cpp
      lang.rust
      lang.zig
      lang.csharp
      lang.jsTs
      lang.python
      lang.odin
    ];
  };
}
