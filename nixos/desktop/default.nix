{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../system.nix
  ];

  features = {
    niri.enable = true;
    nvidia.enable = true;
    gaming.enable = true;
    vpn.enable = true;
    stylix.enable = true;
    flatpak.enable = true;
    apps.enable = true;
    development.enable = true;
    terminal.enable = true;
    virtualization.enable = true;
    noctalia.enable = true;
  };

  networking.hostName = "desktop";

  hardware.logitech = {
    wireless = {
      enable = true;
      enableGraphical = true;
    };
  };

  environment.systemPackages = with pkgs; [
    heroic
    cudaPackages.cudatoolkit
  ];
}
