{ pkgs, lib, config, userSettings, inputs, ... }:

let
  cfg = config.features.apps;
in
{
  options.features.apps.enable = lib.mkEnableOption "standard user apps";

  config = lib.mkIf cfg.enable {
    services.flatpak.enable = true;

    home-manager.users.${userSettings.username} = { ... }: {
      imports = [ inputs.zen-browser.homeModules.twilight ];

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

        # Python
        python3
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
