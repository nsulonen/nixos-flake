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
}
