{ config, pkgs, ... }:

let
  pkgs-unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true; # Allow unfree inside the unstable channel too
  };
in

{
  # Enable unfree packages for standard nixpkgs
  nixpkgs.config.allowUnfree = true;

  # Timezone
  time.timeZone = "Europe/Brussels";

  programs.firefox.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    neovim
    wget
    git
    fastfetch
    btop
    sbctl
    thunar # Fixed deprecation warning (replaced xfce.thunar with thunar)
    kitty
    yazi
    nwg-look
    protonplus
    lutris
    pkgs-unstable.vm-curator
  ];
}
