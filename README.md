## My NixOS configuration

## Prerequisites

- [NixOS](https://nixos.org/download/)

## How to use

1. Copy your hardware-configuration.nix

```sh
cp /etc/nixos/hardware-configuration.nix nixos-config/hosts/red/hardware.nix
```

2. Backup the original configuration

```sh
sudo mv /etc/nixos /etc/nixos.bak
```

3. Create a symbolic link

```sh
sudo ln -s nixos-config /etc/nixos
```

4. Run flake

```sh
sudo nixos-rebuild switch
```

## References
- https://github.com/ostmarco/dotfiles
- https://nixos-and-flakes.thiscute.world/
- https://nixos.wiki/
- https://nixos.org/
