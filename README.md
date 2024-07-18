## My first NixOS configuration

### To do

- [ ] Sway
- [ ] Terminal
- [ ] Code editor
- [ ] DevTools (i.e. docker, git...)
- [ ] Bluetooth
- [ ] Audio
- [ ] Wifi

### How to use

1. Copy your hardware-configuration.nix

```sh
cp /etc/nixos/hardware-configuration.nix ~/nixos-config/nixos
```

2. Backup the original configuration

```sh
sudo mv /etc/nixos /etc/nixos.bak
```

3. Create a symbolic link

```sh
sudo ln -s ~/nixos-config/ /etc/nixos
```

4. Run flake

```sh
sudo nixos-rebuild switch
```