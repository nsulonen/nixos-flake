{ pkgs, lib, config, userSettings, ... }:

let
  cfg = config.features.terminal;
in
{
  options.features.terminal.enable = lib.mkEnableOption "terminal tools";

  config = lib.mkIf cfg.enable {
    home-manager.users.${userSettings.username} = { ... }: {
      home.packages = with pkgs; [
        wl-clipboard
      ];

      programs = {
        fish.enable = true;

        alacritty = {
          enable = true;
          settings = {
            window.padding.x = 5;
          };
        };

        gemini-cli = {
          enable = true;
        };

        starship = {
          enable = true;
          enableFishIntegration = true;
          enableTransience = true;
        };
      };
    };
  };
}
