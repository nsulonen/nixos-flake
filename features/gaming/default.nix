{ config, lib, pkgs, ... }:

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

    environment.systemPackages = with pkgs; [
      gawk
      procps
      unzip
      xdotool
      xprop
      xrandr
      xwininfo
      xxd
      yad
      steamtinkerlaunch
    ];
  };
}
