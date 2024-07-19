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

  programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };


  programs.git = {
    enable = true;
    userName = "Luis Sena";
    userEmail = "luis.senarode@gmail.com";
  };

  programs.starship = {
    enable = true;
  };

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
        starship init fish | source
      '';
  };

  programs.kitty = {
     enable = true;

      settings = {
        copy_on_select = true;
      };
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "23.05";
}
