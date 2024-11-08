{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
  ];

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

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  nix = {
    settings = {
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "sena"];
      substituters = ["https://cachix.cachix.org" "https://cache.nixos.org" "http://nix-cache.irancho.com.br"];
      trusted-substituters = ["https://cachix.cachix.org" "https://cache.nixos.org" "http://nix-cache.irancho.com.br"];
      trusted-public-keys = ["nix-cache.irancho.com.br:HvCdS6lKTt7MTMnBLfcGAVqmroQiEV1j36tbNr0YM98=" "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" "cachix.cachix.org-1:eWNHQldwUO7G2VkjpnjDbWwy4KQ/HNxht7H4SSoMckM="];

      auto-optimise-store = true;
    };
  };

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  environment.systemPackages = [
    pkgs.pavucontrol
    pkgs.qjackctl

    pkgs.stremio
    pkgs.google-chrome
    pkgs.slack
    pkgs.vesktop

    pkgs.rustc
    pkgs.cargo
    pkgs.gcc
    pkgs.rustfmt

    pkgs.devenv
    pkgs.cachix
    pkgs.git
    pkgs.vscode-fhs
    pkgs.alejandra
    pkgs.dotnet-sdk_8

    pkgs.beekeeper-studio

    pkgs.cloudflare-warp
    pkgs.google-cloud-sdk
  ];

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  programs = {
    bash = {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${pkgs.fish}/bin/fish $LOGIN_OPTION
        fi
      '';
    };
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ./wallpaper.png;
    polarity = "dark";

    opacity.terminal = 0.6;
  };

  time = {
    timeZone = "America/Sao_Paulo";
  };

  i18n = {
    extraLocaleSettings = {
      LC_ADDRESS = "pt_BR.UTF-8";
      LC_IDENTIFICATION = "pt_BR.UTF-8";
      LC_MEASUREMENT = "pt_BR.UTF-8";
      LC_MONETARY = "pt_BR.UTF-8";
      LC_NAME = "pt_BR.UTF-8";
      LC_NUMERIC = "pt_BR.UTF-8";
      LC_PAPER = "pt_BR.UTF-8";
      LC_TELEPHONE = "pt_BR.UTF-8";
      LC_TIME = "pt_BR.UTF-8";
    };
  };

  services = {
    blueman.enable = true;

    printing.enable = true;

    pipewire = {
      enable = true;
      audio.enable = true;

      alsa.enable = true;
      alsa.support32Bit = true;

      pulse.enable = true;
      jack.enable = true;

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

    xserver = {
      enable = true;

      displayManager = {
        gdm.enable = true;

        autoLogin = {
          enable = true;
          user = "sena";
        };
      };

      desktopManager.gnome.enable = true;

      xkb = {
        layout = "us";
        variant = "intl";
      };
    };
  };

  security = {
    rtkit.enable = true;
  };

  console = {
    keyMap = "us";
  };

  users = {
    users.sena = {
      isNormalUser = true;
      description = "sena";
      extraGroups = ["networkmanager" "wheel" "docker" "audio" "realtime"];
      packages = with pkgs; [
      ];
    };
  };

  virtualisation = {
    docker.enable = true;
  };

  systemd = {
    services = {
      "getty@tty1".enable = false;
      "autovt@tty1".enable = false;
    };
  };

  system = {
    stateVersion = "24.05";
  };
}
