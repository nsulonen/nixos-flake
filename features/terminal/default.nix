{ pkgs, ... }:

{
  home.packages = with pkgs; [
    wl-clipboard
  ];

  programs = {
    fish.enable = true;

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
