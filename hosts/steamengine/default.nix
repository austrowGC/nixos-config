{ pkgs
, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];


  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 3;
      };
      efi = {
        canTouchEfiVariables = true;
      };
      timeout = 5;
    };
  };
  hardware.opengl.enable = true;
  gnome.enable = true;
  games.enable = true;
}