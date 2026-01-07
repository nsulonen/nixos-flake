{ pkgs, userSettings, ... }:

{
  home.packages = with pkgs; [
    # Search tools
    ripgrep
    fd

    # Git TUI
    lazygit

    # LSP
    nixd
    nil

    # Development Environments
    devenv
  ];

  programs = {
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
  };
}
