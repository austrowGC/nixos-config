{pkgs, config, lib, ...}: {
  imports =
  [ "./games.nix"
    "./kitty.nix"
    "./obs.nix"
    "./thunar.nix"
    "./waybar.nix"
    "./wofi.nix"
  ];

  games.enable = lib.mkDefault false;
}
