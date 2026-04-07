
{ config, pkgs, ... }:

{
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    (awscli2.overridePythonAttrs (old: {
      doCheck = false;
      doInstallCheck = false;
      dontCheck = true;
    }))
  ];
}
