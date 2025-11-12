{ ... }:

{
  imports = [
    ./hardware.nix
    ../system.nix
    ../modules/niri.nix
    ../modules/nvidia.nix
    ../modules/steam.nix
    ../modules/stylix.nix
  ];

  hardware.logitech = {
    wireless = {
      enable = true;
      enableGraphical = true;
    };
  };

  services.udev.extraRules = ''
    ACTION=="add" SUBSYSTEM=="pci" ATTR{vendor}=="0x1022" ATTR{device}=="0x43ee" ATTR{power/wakeup}="disabled"
  '';
}
