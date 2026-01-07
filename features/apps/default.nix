{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    # Notes
    obsidian

    # Tools
    xwayland-satellite
    bottles
    protontricks
    protonup-qt

    # File Management
    nautilus

    # Media Player
    vlc
  ];

  programs = {
    discord.enable = true;
    zen-browser.enable = true;
  };

  services = {
    # Mako for Notifications
    mako = {
      enable = true;
    };
  };

  systemd.user.startServices = "sd-switch";
}