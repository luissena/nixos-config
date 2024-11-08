{
  config,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ../wallpaper.png;
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
