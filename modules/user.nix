{ pkgs, ... }:

{ 

  programs.fish.enable = true;

  # Define your user account
  users.users.alex = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
    shell = pkgs.fish;
  };
}
