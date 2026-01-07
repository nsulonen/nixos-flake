{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../system.nix
    ../modules/niri.nix
    ../modules/stylix.nix
  ];

  networking.hostName = "laptop";

  #for cpu temp control
  boot.kernelParams = [ "amd_pstate=guided" ];
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "schedutil";

  #packages
  environment.systemPackages = with pkgs; [
    #brightnessctl
    mesa
  ];

  #services
  services = {
    tuned.enable = true;
    power-profiles-daemon.enable = false;
    upower.enable = true;

    #for out of memory
    earlyoom.enable = true;
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
