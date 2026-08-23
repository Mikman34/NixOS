{ config, pkgs, ... }:

let
  pkgs-unstable = import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz") {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true; # Allow unfree inside the unstable channel too
  };
in

{
   environment.systemPackages = with pkgs; [
    qemu_full
  ];
}
