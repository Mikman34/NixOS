{ pkgs, ... }:

{
  imports = [
    /etc/nixos/Arctis-Sound-Manager/nix/module.nix
  ];

  # Disable PulseAudio (PipeWire handles this)
  services.pulseaudio.enable = false;

  # Enable real-time scheduling for low latency
  security.rtkit.enable = true;

  # Enable PipeWire service
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable Arctis Sound Manager service
  services.arctis-sound-manager.enable = true;

  # Optional utility tools
  environment.systemPackages = with pkgs; [
    pavucontrol
    wireplumber
  ];
}
