{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./git.nix
    ./terminal.nix
  ];
}
