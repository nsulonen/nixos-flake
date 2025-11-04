{ pkgs, ... }:

{
  packages = [ pkgs.dotnetCorePackages.sdk_9_0-bin ];

  languages.c.enable = true;
}
