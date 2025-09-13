{ config, ... }:

{
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;

    open = true;

    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  #enable wlr portal for nvidia screencasting
  xdg.portal = {
    enable = true;

    wlr = {
      enable = true;
      settings = {
        screencast = {
          force_mod_linear = true;
        };
      };
    };
  };
}
