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

  ];

  #programs
  programs = {

    distrobox = {
      enable = true;
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

    helix = {
      enable = true;
      settings = {
        editor = {
          line-number = "relative";
          lsp.display-messages = true;
        };
        keys.normal = {
          space.w = ":w";
          space.q = ":q";
        };
      };
    };

    kitty = {
      enable = true;
      settings = {
        window_padding_width = "0 20";
      };
    };

    swaylock = {
      enable = false;
    };

    waybar = {
      enable = false;
    };

    fuzzel = {
      enable = false;
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

    gemini-cli = {
      enable = true;
    };

    starship = {
      enable = true;
      enableBashIntegration = true;
    };

    bash = {
      enable = true;
    };
  };
}
