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
  };
}
