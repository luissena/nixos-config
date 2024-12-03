{
  config,
  pkgs,
  ...
}: {
  services = {
    pipewire = {
      enable = true;
      audio.enable = true;

      alsa.enable = true;
      alsa.support32Bit = true;

      pulse.enable = true;
      jack.enable = false;

      extraConfig.pipewire = {
        "92-low-latency" = {
          "context.properties" = {
            "default.clock.rate" = 48000;
            "default.clock.quantum" = 96;
            "default.clock.min-quantum" = 96;
            "default.clock.max-quantum" = 480;
          };

          "context.modules" = [
            {
              name = "libpipewire-module-rtkit";
              args = {
                "nice.level" = -15;
                "rt.prio" = 88;
                "rt.time.soft" = 200000;
                "rt.time.hard" = 200000;
              };
            }
          ];

          "jack.properties" = {
            node.quantum = "96/48000";
          };
        };
      };
    };
  };

  users = {
    users.sena = {
      extraGroups = ["audio" "realtime"];
    };
  };

  environment.systemPackages = [
    pkgs.pavucontrol
    pkgs.qjackctl
  ];
}
