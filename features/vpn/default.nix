{ pkgs, ... }:

{
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
}
