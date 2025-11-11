{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../system.nix
    ../modules/niri.nix
    ../modules/stylix.nix
  ];

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

  #services
  services = {
    power-power-profiles-daemon.enable = true;
    upower.enable = true;
  };

  #bluetooth
  hardware.bluetooth.enable = true;
}
