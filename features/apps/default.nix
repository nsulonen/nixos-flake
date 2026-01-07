{ pkgs, lib, config, userSettings, ... }:

let
  cfg = config.features.apps;
in
{
  options.features.apps.enable = lib.mkEnableOption "standard user apps";

  config = lib.mkIf cfg.enable {
    nixpkgs.config.allowUnfree = true;

    home-manager.users.${userSettings.username} = { ... }: {
      home.packages = with pkgs; [
        # Notes
        obsidian

        # Tools
        xwayland-satellite
        bottles
        protontricks
        protonup-qt

        # File Management
        nautilus

        # Media Player
        vlc
      ];

      programs = {
        discord.enable = true;
        zen-browser.enable = true;
      };

      services = {
        # Mako for Notifications
        mako = {
          enable = true;
        };
      };

      systemd.user.startServices = "sd-switch";
    };
  };
}