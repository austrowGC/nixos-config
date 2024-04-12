#
#  System Menu
#

{ config, lib, pkgs, vars, ... }:

{
  config = lib.mkIf (config.wlwm.enable) {
    home-manager.users.${vars.user} = {
      home = {
        packages = with pkgs; [
          wofi
        ];
      };

    };
  };
}
