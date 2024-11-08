{
  config,
  pkgs,
  ...
}: {
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;

      package = pkgs.bluez-experimental;

      settings = {
        General = {
          MultiProfile = "multiple";
          FastConnectable = "true";
          Experimental = "true";
          ResumeDelay = "4";
        };
      };
    };

    pulseaudio = {
      extraModules = [pkgs.pulseaudio-modules-bt];

      extraConfig = ''
        load-module module-switch-on-connect

        unload module-bluetooth-policy
        load-module module-bluetooth-policy auto_switch=2

        unload module-bluetooth-discover
        load-module module-bluetooth-discover headset=native
      '';
    };
  };

  services = {
    blueman.enable = true;

    pipewire = {
      wireplumber.extraConfig = {
        "10-bluez" = {
          "monitor.bluez.properties" = {
            "bluez5.enable-hw-volume" = true;
          };
        };

        "11-bluetooth-policy" = {
          "wireplumber.settings" = {
            "bluetooth.autoswitch-to-headset-profile" = false;
          };
        };
      };
    };
  };
}
