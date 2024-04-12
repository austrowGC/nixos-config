#
#  Terminal Emulator
#

{ pkgs, vars, ... }:

let
  colors = import ../themes/colors.nix;
in
{
  home-manager.users.${vars.user} = {
    programs = {
      kitty = {
        enable = true;
        theme = "Afterglow";
        settings = {
          confirm_os_window_close = 0;
          enable_audio_bell = "no";
          resize_debounce_time = "0";
          background = "#${colors.scheme.default.hex.bg}";
          font_family = "FiraCode Nerd Font";
        };
      };
    };
  };
}
