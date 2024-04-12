#
#  These are the different profiles that can be used when building NixOS.
#
#  flake.nix
#   └─ ./hosts
#       ├─ default.nix *
#       ├─ configuration.nix
#       └─ ./<host>.nix
#           └─ default.nix
#

{ lib, inputs, nixpkgs, nixpkgs-unstable, nixos-hardware, home-manager, nur, nixvim, hyprland, hyprlock, hypridle, vars, ... }:

let
  system = "x86_64-linux"; # System Architecture

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true; # Allow Proprietary Software
  };

  unstable = import nixpkgs-unstable {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in
{

  thinkpad = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs system unstable hyprland hyprlock hypridle vars;
      host = {
        hostName = "thinkpad";
        # assign monitors?
      };
    };
    modules = [
      nixvim.nixosModules.nixvim
      ./thinkpad
      ./configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      }
    ];
  };

  steamengine = lib.nixosSystem {
    inherit system;
    specialArgs = {
      inherit inputs system unstable vars;
      host = {
        hostName = "steamengine";
      };
    };
    modules = [
      nixvim.nixosModules.nixvim
      ./steamengine
      ./configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      }
    ];
    
  };

}
