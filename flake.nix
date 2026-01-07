{
  description = "NixOS system flake";

  inputs = {

    nixpkgs.url = "nixpkgs/nixos-unstable";

    niri.url = "github:sodiboo/niri-flake";

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.home-manager.follows = "home-manager";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      stylix,
      niri,
      zen-browser,
      home-manager,
      noctalia,
      ...
    }@inputs:
    let
      systemSettings = {
        system = "x86_64-linux";
        hostname = "nixos";
        timezone = "Europe/Helsinki";
        locale = "en_US.UTF-8";
        stateVersion = "25.05";
      };

      userSettings = {
        username = "niko";
        name = "nsulonen";
        email = "niko.sulonen@proton.me";
        dotfilesDir = "/home/niko/System";
      };

      pkgsArgs = {
        inherit inputs;
        inherit systemSettings;
        inherit userSettings;
      };

      makeSystem =
        systemConfigFile:
        nixpkgs.lib.nixosSystem {
          system = systemSettings.system;
          specialArgs = pkgsArgs;
          modules = [
            systemConfigFile
            ./features
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                extraSpecialArgs = pkgsArgs;
                users.${userSettings.username} = {
                  imports = [
                    ./home-manager/home.nix
                  ];
                };
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        desktop = makeSystem ./nixos/desktop;
        laptop = makeSystem ./nixos/laptop;
      };
    };
}
