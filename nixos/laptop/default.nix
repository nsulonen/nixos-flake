{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../system.nix
    ../modules/niri.nix
    ../modules/stylix.nix
  ];

  #for cpu temp control
  boot.kernelParams = [ "amd_pstate=guided" ];
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "schedutil";

  environment.systemPackages = with pkgs; [
    brightnessctl
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
