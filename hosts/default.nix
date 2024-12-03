{
  config,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
  programs.steam.enable = true;
  hardware.graphics = {
    enable = true;
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
    pkgs.stremio
    pkgs.google-chrome
    pkgs.slack
    pkgs.vesktop
    pkgs.obs-studio
    pkgs.postman
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
    pkgs.jetbrains.datagrip
    pkgs.jetbrains.rider
    pkgs.droidcam
    pkgs.obs-studio-plugins.droidcam-obs
    pkgs.google-cloud-sql-proxy
    pkgs.beekeeper-studio

    pkgs.google-cloud-sdk
  ];

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
      extraGroups = ["wheel"];
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";
    users = {
      sena = {
        home = {
          username = "sena";
          homeDirectory = "/home/sena";
          stateVersion = "24.05";
        };
      };
    };
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
