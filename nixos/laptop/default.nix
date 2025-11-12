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
    tuned.enable = true;
    power-profiles-daemon.enable = false;
    upower.enable = true;
  };

  #bluetooth
  hardware.bluetooth.enable = true;

  #enable zram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 80;
  };
}
