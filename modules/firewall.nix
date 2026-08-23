{ config, pkgs, ... }:

{
  networking.firewall = {
    enable = true;

    # Open specific TCP ports (e.g., SSH, web servers, game servers)
    # allowedTCPPorts = [ 22 80 443 ];

    # Open specific UDP ports
    # allowedUDPPorts = [ 53 ];

    # Open port ranges (useful for KDE Connect, Steam local transfers, etc.)
    # allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
    # allowedUDPPortRanges = [ { from = 1714; to = 1764; } ];
  };
}
