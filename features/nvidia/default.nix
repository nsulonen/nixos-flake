{ config, lib, pkgs, ... }:

let
  cfg = config.features.nvidia;
in
{
  options.features.nvidia.enable = lib.mkEnableOption "nvidia drivers";

  config = lib.mkIf cfg.enable {
    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = true; # for system suspend to work
      powerManagement.finegrained = false;

      open = true;

      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };

    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
