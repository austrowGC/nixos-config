{ pkgs
, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  gnome.enable = true;
  games.enable = true;
}