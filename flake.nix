{
  description = "my xmonad configurations";

  inputs = {
    haedosa.url = "github:haedosa/flakes/22.05";
    nixpkgs.follows = "haedosa/nixpkgs";
    home-manager.follows = "haedosa/home-manager";
    #wallpapers.url = "github:jjdosa/wallpapers";
    wallpapers.url = "/home/kw/Mysync/wallpaper/2022AugCat.jpg";
    wallpapers.flake = false;
  };

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
    in {
      hmModule = import ./hmModule.nix inputs.wallpapers;
      devShell.${system} =
        pkgs.mkShell { buildInputs = with pkgs; [ xmonad-with-packages ]; };
    };

}
