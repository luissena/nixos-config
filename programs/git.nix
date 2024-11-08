{
  config,
  pkgs,
  ...
}: {
  home-manager.users.sena = {
    programs = {
      git = {
        enable = true;
        userName = "Luis Sena";
        userEmail = "luis.senarode@gmail.com";
      };
    };
  };
}
