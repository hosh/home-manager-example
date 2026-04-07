
{ config, lib, pkgs, ... }:

{
  # This gets passwed to the config.allowUnfreePredicate
  my-allowed-unfree = [
    "claude-code"
  ];

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    claude-code
    gemini-cli-bin
  ];
}
