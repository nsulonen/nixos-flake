{ pkgs, lib, config, ... }:

let
  cfg = config.features.flatpak;
in
{
  options.features.flatpak.enable = lib.mkEnableOption "flatpak";

  config = lib.mkIf cfg.enable {
    services.flatpak.enable = true;

    system.activationScripts.flatpak-repo = {
      text = ''
        ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      '';
    };
  };
}
