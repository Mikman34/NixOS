{ config, pkgs, ... }:

let
  # Fetch nixos-unstable channel for Noctalia V5
  pkgs-unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = config.nixpkgs.config.allowUnfree;
  };
in
{
  # Enable Niri program & session files
  programs.niri.enable = true;

  # Enable Polkit (still good practice for system privilege prompts)
  security.polkit.enable = true;

  # Essential system packages for Niri
  environment.systemPackages = [
    pkgs.xwayland
    pkgs.xwayland-satellite
    pkgs-unstable.noctalia
  ];

  environment.variables = {
    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "Adwaita"; # Make sure this matches Niri perfectly
  };

}
