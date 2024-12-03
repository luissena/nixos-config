{
  config,
  pkgs,
  ...
}: {
  home-manager.users.sena = {
    programs = {
      gnome-shell = {
        enable = true;

        extensions = [
          {package = pkgs.gnomeExtensions.blur-my-shell;}
          {package = pkgs.gnomeExtensions.dash-to-dock;}
          {package = pkgs.gnomeExtensions.system-monitor;}
        ];
      };

      home-manager.enable = true;
    };

    dconf = {
      settings = {
        "org/gnome/settings-daemon/plugins/media-keys" = {
          custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"];
        };

        "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          binding = "<Super>s";
          command = "gnome-terminal";
          name = "Open terminal";
        };

        "org/gnome/shell" = {
          disable-user-extensions = false;
          enabled-extensions = [
            "dash-to-dock"
            "blur-my-shell"
            "system-monitor"
          ];
        };
      };
    };
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ../../assets/images/wallpaper.png;
    polarity = "dark";

    opacity.terminal = 0.6;
  };

  services = {
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
}
