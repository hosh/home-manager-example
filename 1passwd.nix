{ config, lib, pkgs, ... }:
{
  # This gets passwed to the config.allowUnfreePredicate
  my-allowed-unfree = [
    "1password-gui"
    "1password-cli"
  ];

  home.packages = with pkgs; [
    _1password-cli
  ];
}
