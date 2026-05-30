{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../system.nix
  ];

  features = {
    niri.enable = true;
    stylix.enable = true;
    vpn.enable = true;
    flatpak.enable = true;
    apps.enable = true;
    development.enable = true;
    terminal.enable = true;
    virtualization.enable = true;
    noctalia.enable = true;
  };

  networking.hostName = "laptop";

  #for cpu temp control
  boot.kernelParams = [ "amd_pstate=guided" ];
  powerManagement.enable = true;
  powerManagement.cpuFreqGovernor = "schedutil";

  #packages
  environment.systemPackages = with pkgs; [
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
