{ config, pkgs, ... }:

{
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;

    open = true;

    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  #enable wlr portal for nvidia screencasting
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = "wlr";
      };
    };

    wlr = {
      enable = true;
      settings = {
        screencast = {
          force_mod_linear = true;
        };
      };
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
    ];

  };
}
