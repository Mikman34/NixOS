{ pkgs, ... }:

{
  # Install cursor theme system-wide so XWayland/GTK can find it
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
  ];

  # Set session environment variables so XWayland, GTK, and Qt inherit the size
  environment.sessionVariables = {
    XCURSOR_SIZE = "24";
    XCURSOR_THEME = "Adwaita";
  };
}
