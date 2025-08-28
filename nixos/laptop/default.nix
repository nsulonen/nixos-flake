{ pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ../system.nix
    ../modules/niri.nix
    ../modules/stylix.nix
    ../modules/samk.nix
  ];

  environment.systemPackages = with pkgs; [
    brightnessctl
  ];

}
