{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../system.nix
    ../modules/niri.nix
    ../modules/nvidia.nix
    ../modules/steam.nix
    ../modules/stylix.nix
  ];

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

  # to prevent uncontrolled wakeup from suspend, but seems to work without now
  # services.udev.extraRules = ''
  #   ACTION=="add" SUBSYSTEM=="pci" ATTR{vendor}=="0x1022" ATTR{device}=="0x43ee" ATTR{power/wakeup}="disabled"
  # '';
}
