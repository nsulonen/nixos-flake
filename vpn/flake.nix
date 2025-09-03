{
  description = "openvpn3 from nixos-25.05";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";
  };

  outputs =
    { nixpkgs, ... }:
    {
      devShells.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.mkShell {
        buildInputs = [ nixpkgs.legacyPackages.x86_64-linux.openvpn3 ];
      };

      packages.x86_64-linux.default = nixpkgs.legacyPackages.x86_64-linux.hello;
    };
}
