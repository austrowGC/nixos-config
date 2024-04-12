{ pkgs, ... }:
let
  blanksha256 = (pkgs.lib.lists.foldr (a: b: a+b) "" (pkgs.lib.lists.replicate 52 "0"));
in
{
  imports =
    [ ./hardware-configuration.nix
    ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
      # efi.efiSysMountPoint = "/boot";
      grub.configurationLimit = 4;
      grub.efiSupport = true;
      timeout = 3;
    };
  };

  hardware = {
    opengl = {
      # Hardware Accelerated Video
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        vaapiIntel
        vaapiVdpau
        libvdpau-va-gl
      ];
    };
  };

  laptop.enable = true;
  hyprland.enable = true;

  environment = {
    systemPackages = with pkgs; [
      codium
      discord
      gimp
      go2tv
      obs-studio
      # jellyfin-media-player # https://jellyfin.org
      # kodi  # https://kodi.tv
    ];
  };

  # services = {};
  # systemd.tmpfiles.rules = []; systemd.targets ...

  programs.light.enable = true;  # monitor brightness

  nixpkgs.overlays = [
    # overlays, pulling latest version of discord
    (final: prev: {
      discord = prev.discord.overrideAttrs (
        _: { src = builtins.fetchTarball {
          url = "https://discord.com/api/download?platform=linux&format=tar.gz";
          # change blank sha with actual value
          sha256 = blanksha256;
        };}
      );
    })
  ];
}