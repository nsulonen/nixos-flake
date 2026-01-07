{ pkgs, lib, config, ... }:

let
  cfg = config.features.virtualization;
in
{
  options.features.virtualization.enable = lib.mkEnableOption "virtualization tools";

  config = lib.mkIf cfg.enable {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork.settings.dns_enabled = true;
    };

    environment.systemPackages = with pkgs; [
      distrobox
    ];
  };
}
