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

}
