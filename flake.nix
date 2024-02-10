{
  description = "Controller library that allows applications to interact with Tor";

  outputs = { self, nixpkgs }:
    let
      inherit (nixpkgs) lib;
      forAllSystems = lib.genAttrs lib.systems.flakeExposed;
    in
    {
      packages = forAllSystems (system: {
        inherit (nixpkgs.legacyPackages.${system}.python3Packages) stem;
        default = self.packages.${system}.stem;
      });
    };
}
