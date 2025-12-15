{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  #home.packages
  home.packages = with pkgs; [
    #knowledge management
    obsidian

    #tools
    devenv
    xwayland-satellite
    bottles
    wl-clipboard
    protontricks
    protonup-qt

    #lsp
    nixd
    nil
    python313Packages.python-lsp-server

    #file management
    nautilus

    #media player
    vlc
    grayjay

    #screen recording
    wf-recorder
    slurp

  ];

  #programs
  programs = {

    fish.enable = true;
    
    discord.enable = true;

    distrobox.enable = true;

    zen-browser.enable = true;

    freetube.enable = true;

    noctalia-shell.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
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

    helix = {
      enable = true;
      settings = {
        editor = {
          line-number = "relative";
          lsp.display-messages = true;
          soft-wrap.enable = true;
        };
        keys.normal = {
          space.w = ":w";
          space.q = ":q";
        };
      };
    };

    alacritty = {
      enable = true;
      settings = {
        window.padding.x = 20;
      };
    };

    gemini-cli = {
      enable = true;
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
      enableTransience = true;
      # settings = pkgs.lib.importTOML ../configs/starship.toml;
    };
  };
}
