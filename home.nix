{
  config,
  pkgs,
  ...
}: {
  home = {
    username = "sena";
    homeDirectory = "/home/sena";
    stateVersion = "24.05";

    packages = with pkgs; [];
  };

  programs = {
    git = {
      enable = true;
      userName = "Luis Sena";
      userEmail = "luis.senarode@gmail.com";
    };

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
}
