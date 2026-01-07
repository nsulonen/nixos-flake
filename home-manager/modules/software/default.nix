{ pkgs, userSettings, ... }:

{
  nixpkgs.config.allowUnfree = true;

  #home.packages
  home.packages = with pkgs; [
    #notes
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

    #file management
    nautilus

    #media player
    vlc
    
  ];

  #programs
  programs = {

    fish.enable = true;
    
    discord.enable = true;

    distrobox.enable = true;

    zen-browser.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
       
    gh = {
      enable = true;
      hosts = {
        "github.com" = {
          user = userSettings.name;
        };
      };
    };

    git = {
      enable = true;
      settings = {
        init.defaultBranch = "main";
        user.name = userSettings.name;
        user.email = userSettings.email;
        core.editor = "hx";
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
        window.padding.x = 5;
      };
    };

    gemini-cli = {
      enable = true;
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
      enableTransience = true;
    };
  };
}
