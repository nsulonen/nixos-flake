{ pkgs, ... }:

{
  # enable theming for targets
  stylix.targets = {
    zen-browser.profileNames = [ "default" ];
  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };
}
