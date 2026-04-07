{ config, pkgs, ... }:

{
  imports = [ ../common.nix ../macosx.nix ../dev-workstation.nix ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "example";
  home.homeDirectory = "/Users/example";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    minikube
    vfkit
  ];

  # Example for installing dotfiles. This is composed with
  # the modules that are included
  home.file = {
    ".tmuxinator/personal.yml".source = ../tmuxinator/personal.yml;
    ".tmuxinator/ai.yml".source = ../tmuxinator/ai.yml;
  };

  programs.git = {
    settings = {
      user = {
        name = "Personal Identity";
        email = "person@example.com";
      };
    };
  };

  # https://git.gc4.at/linux/ohmyzsh/src/commit/64d881b479cec5e62384176773f1b4d0a057ba47/plugins/keychain
  programs.zsh.oh-my-zsh.extraConfig = ''
    zstyle :omz:plugins:keychain identities id_rsa
  '';

}
