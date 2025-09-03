{ pkgs, ... }:

{
  imports = [
    ./modules/samk.nix
  ];

  #bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #networking
  networking = {

    hostName = "nixos";

    networkmanager = {
      enable = true;
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };

  };

  #locale
  time.timeZone = "Europe/Helsinki";
  i18n.defaultLocale = "en_US.UTF-8";
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
    displayManager.gdm.enable = true;
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
    users.niko = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
    };
  };

  #settings
  nix.settings = {
    trusted-users = [
      "root"
      "niko"
    ];
    experimental-features = [
      "nix-command"
      "flakes"
    ];
  };

  #packages
  environment.systemPackages = with pkgs; [
    git
    vim
    wget
  ];

  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "25.05";
}
