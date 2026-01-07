{ config, lib, ... }:

let
  cfg = config.features.gaming;
in
{
  options.features.gaming.enable = lib.mkEnableOption "gaming features";

  config = lib.mkIf cfg.enable {
    programs = {
      steam = {
        enable = true;
        gamescopeSession.enable = true;
      };

      gamemode.enable = true;
    };
  };
}
