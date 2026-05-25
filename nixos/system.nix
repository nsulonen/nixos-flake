{ pkgs, lib, systemSettings, userSettings, ... }:

{
  #bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #networking
  networking = {
    hosts = {
      "10.223.88.150" = [ "www.edu.samk.eu" ];
    };

    hostName = lib.mkDefault systemSettings.hostname;

    networkmanager = {
      enable = true;
    };
  };

  #locale
  time.timeZone = systemSettings.timezone;
  i18n.defaultLocale = systemSettings.locale;
  console = {
    font = "Lat2-Terminus16";
    useXkbConfig = true;
  };

  #desktop
  services = {
    xserver = {
      enable = true;
      xkb.layout = "fi";
      xkb.options = "eurosign:e,caps:escape";
    };

    #login manager
    displayManager.ly.enable = true;
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    config.common.default = [ "gtk" ];
  };
  
  #graphics
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  #sound
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  #users
  users = {
    users.${userSettings.username} = {
      shell = pkgs.fish;
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  #settings
  nix.settings = {
    trusted-users = [
      "root"
      userSettings.username
    ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  # shell
  programs = {
    fish.enable = true;
  };
  
  #packages
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
    linux-firmware
  ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (final: prev: {
      openldap = prev.openldap.overrideAttrs (oldAttrs: {
        doCheck = false;
      });
      xdg-desktop-portal = prev.xdg-desktop-portal.overrideAttrs (oldAttrs: {
        doCheck = false;
      });
    })
  ];

  system.stateVersion = systemSettings.stateVersion;
}
