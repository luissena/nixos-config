{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./programs
    ./services
    ./system
  ];
}
