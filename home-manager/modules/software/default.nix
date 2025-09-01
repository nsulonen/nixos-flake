{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  #home.packages
  home.packages = with pkgs; [

    #pkm
    obsidian

    #text editor
    typora

    #tools
    devenv
    swaybg
    xwayland-satellite

    #lsp
    nixd
    nil

    #file management
    nautilus

  ];

  #programs
  programs = {

    distrobox = {
      enable = true;
    };

    firefox = {
      enable = false;
    };

    zen-browser = {
      enable = true;
    };

    gh = {
      enable = true;
      hosts = {
        "github.com" = {
          user = "nsulonen";
        };
      };
    };

    git = {
      enable = true;
      userName = "nsulonen";
      userEmail = "niko.sulonen@proton.me";
      extraConfig = {
        init.defaultBranch = "main";
      };
    };

    neovim = {
      enable = true;
    };

    zed-editor = {
      enable = true;
      extensions = [ "nix" ];
    };

    ghostty = {
      enable = true;

      settings = {
        window-padding-x = 20;
      };
    };

    swaylock = {
      enable = true;
    };

    waybar = {
      enable = true;
    };

    fuzzel = {
      enable = true;
    };
  };
}
