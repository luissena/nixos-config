{
  config,
  pkgs,
  ...
}: {
  home-manager.users.sena = {
    programs = {
      fish = {
        enable = true;
      };

      direnv = {
        enable = true;

        nix-direnv.enable = true;
      };

      starship = {
        enable = true;
        enableFishIntegration = true;
      };
    };
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
}
