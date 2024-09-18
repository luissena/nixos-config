{
  lib,
  pkgs,
  ...
}: {
  imports = [
    ./hardware.nix
  ];

  environment.systemPackages = with pkgs; [
    arion
    bat
    bintools
    bottom
    btop
    coreutils
    curl
    exfat
    eza
    fastfetch
    file
    fzf
    git
    glib
    jq
    libnotify
    mpv
    openssl
    p7zip
    ripgrep
    tldr
    toybox
    unrar
    unzip
    wget
    zip
  ];

  # Services
  services = {
    gnome.gnome-keyring.enable = true;
    redis.servers."redis" = {
      enable = true;
      port = 6379;
    };
  };

  programs = {
    adb.enable = true;
    command-not-found.enable = true;
  };

  modules = {
    programs = {
      fish.enable = true;
      git.enable = true;
      kitty.enable = true;
      starship.enable = true;
    };

    services = {
      docker = {
        enable = true;
        compose = true;
      };

      stylix = {
        enable = true;
        wallpaper = wallpapers/nixos-binary.png;
      };
    };
  };

  # User Account
  user = {
    name = "luis";
    description = "Luis Sena";

    groups = ["adbusers" "docker" "networking" "video" "wheel" "kvm" "dialout"];

    shellAliases = {
      ls = "exa";
      cat = "bat";
    };

    packages = with pkgs; let
      gcloud = google-cloud-sdk.withExtraComponents (with google-cloud-sdk.components; [
        gke-gcloud-auth-plugin
      ]);
    in [
      (discord.override {withOpenASAR = true;})
      brave
      vesktop
      alejandra
      devenv
      gcloud
      jetbrains.datagrip
      jetbrains.rider
      nil
      webcord
      nixd
      postman
      shfmt
      dotnet-sdk_8
      cloudflare-warp
      go
    ];

    home = {
      services.flameshot.enable = true;

      programs = {
        direnv = {
          enable = true;
          nix-direnv.enable = true;
        };

        google-chrome.enable = true;

        vscode = {
          enable = true;
          package = pkgs.vscode.fhs;
          extensions = lib.mkForce [];
          userSettings = lib.mkForce {};
        };
      };
    };
  };
}
