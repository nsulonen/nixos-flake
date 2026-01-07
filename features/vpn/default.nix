{ pkgs, lib, config, ... }:

let
  cfg = config.features.vpn;
in
{
  options.features.vpn.enable = lib.mkEnableOption "vpn services";

  config = lib.mkIf cfg.enable {
    programs.openvpn3.enable = true;

    environment.systemPackages = [ pkgs.openvpn3 ];

    networking.networkmanager = {
      plugins = with pkgs; [ networkmanager-openvpn ];
    };

    services.dbus.packages = with pkgs; [
      networkmanager
      openvpn3
    ];

    services.resolved.enable = true;
  };
}
