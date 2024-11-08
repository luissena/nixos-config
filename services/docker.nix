{
  config,
  pkgs,
  ...
}: {
  virtualisation = {
    docker.enable = true;
  };
  users = {
    users.sena = {
      extraGroups = ["docker"];
    };
  };
  environment.systemPackages = [
    pkgs.cloudflare-warp
  ];
}
