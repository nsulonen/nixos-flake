{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  #home.packages
  home.packages = with pkgs; [
    #knowledge management
    obsidian

    #text editor
    typora

    #tools
    devenv
    swaybg
    xwayland-satellite
    bottles

    #lsp
    nixd
    nil
    python313Packages.python-lsp-server
    omnisharp-roslyn

    #file management
    nautilus

    #media player
    vlc
    grayjay

    #screen recording
    wf-recorder
    slurp

    #shell

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
      settings = {
        init.defaultBranch = "main";
        user.name = "nsulonen";
        user.email = "niko.sulonen@proton.me";
      };
    };

    neovim = {
      enable = true;
    };

    zed-editor = {
      enable = true;
      extensions = [ "nix" ];
    };

    vscode = {
      enable = true;
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

    freetube = {
      enable = true;
    };

    noctalia-shell = {
      enable = true;
    };

    quickshell = {
      enable = true;
    };
  };
}
