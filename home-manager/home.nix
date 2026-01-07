{ systemSettings, userSettings, ... }:

{
  programs.home-manager = {
    enable = true;
  };

  home = {
    username = userSettings.username;
    homeDirectory = "/home/" + userSettings.username;
    stateVersion = systemSettings.stateVersion;
  };

  imports = [
    ../features/apps
    ../features/noctalia
    ../features/development
    ../features/terminal
  ];
}
