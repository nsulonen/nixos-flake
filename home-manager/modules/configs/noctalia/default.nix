{ lib, ... }:

{
  xdg.configFile."noctalia/settings.json".source = lib.mkForce ./settings.json;
}
