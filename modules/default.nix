{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./audio.nix
    ./bluetooth.nix
    ./gui.nix
    ./locale.nix
    ./network.nix
  ];
}
