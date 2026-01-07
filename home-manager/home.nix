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
  ];
}
