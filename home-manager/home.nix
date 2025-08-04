{ config, ... }:

{
  imports = [
    ./packages/packages.nix
  ];

  home = {
    username = "kwebo";
    homeDirectory = "/home/kwebo";
    stateVersion = "25.05";
  };
}
