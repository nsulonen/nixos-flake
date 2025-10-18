{ ... }:

{
  services = {

    #podman for distrobox
    podman = {
      enable = true;
    };

    #mako for notifications
    mako = {
      enable = true;
    };

    flatpak = {
      enable = true;
    };
  };

  systemd.user.startServices = "sd-switch";
}
