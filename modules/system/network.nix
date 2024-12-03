{
  config,
  pkgs,
  ...
}: {
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };
  users = {
    users.sena = {
      extraGroups = ["networkmanager"];
    };
  };
  environment.systemPackages = [
    pkgs.cloudflare-warp
  ];
}
