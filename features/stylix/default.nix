{ pkgs, lib, config, userSettings, inputs, ... }:

let
  cfg = config.features.stylix;
in
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  options.features.stylix.enable = lib.mkEnableOption "stylix appearance";

  config = lib.mkIf cfg.enable {
    # --- System Level Stylix ---
    stylix = {
      enable = true;
      autoEnable = true;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/ayu-dark.yaml";

      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Original-Ice";
        size = 36;
      };

      fonts = {
        monospace = {
          package = pkgs.nerd-fonts.jetbrains-mono;
          name = "JetBrainsMono Nerd Font Mono";
        };
        sansSerif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Sans";
        };
        serif = {
          package = pkgs.dejavu_fonts;
          name = "DejaVu Serif";
        };
      };
    };

    # --- User Level Stylix & GTK ---
    home-manager.users.${userSettings.username} = { ... }: {
      stylix.targets = {
        zen-browser.profileNames = [ "default" ];
      };

      gtk = {
        enable = true;
        iconTheme = {
          package = pkgs.papirus-icon-theme;
          name = "Papirus-Dark";
        };
      };
    };
  };
}
