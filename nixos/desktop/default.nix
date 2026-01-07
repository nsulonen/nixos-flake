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

  # to prevent uncontrolled wakeup from suspend, but seems to work without now
  # services.udev.extraRules = ''
  #   ACTION=="add" SUBSYSTEM=="pci" ATTR{vendor}=="0x1022" ATTR{device}=="0x43ee" ATTR{power/wakeup}="disabled"
  # '';
}
