{ inputs
, lib
, config
, pkgs
, ...
}: {
  
  imports = [
    
  ];

  home = {
    username = "luis";
    homeDirectory = "/home/luis";
  };

 
  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = "Luis Sena";
    userEmail = "luis.senarode@gmail.com";
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.05";
}
