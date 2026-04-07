# This is used as a module for common gitconfig configurations
{ config, pkgs, ... }:

{
  programs.git = {
    config = {
      merge.tool = "p4merge";
      mergetool.prompt = false;
      mergetool.keepBackup = false;

      rerere.enabled = true;
      color = {
        status = "auto";
        diff = "auto";
        branch = "auto";
      };
    };
  };
}

