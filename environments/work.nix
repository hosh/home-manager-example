{ config, pkgs, ... }:

{
  imports = [ ../common.nix ../macosx.nix ../dev-workstation.nix ../awscli.nix ../1passwd.nix ../ai.nix ];

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
    heroku
    postgresql_16
    minikube
    vfkit
    shellcheck

    procps

    # Podman is free and most of the interface is close enough to docker
    podman
    podman-tui
    podman-compose

    # No one in Solace is using nix and I don't want to introduce it
    # fnm looks like a good nvm replacement
    fnm
  ];

  programs.git = {
    settings = {
      user = {
        name = "Example Person";
        email = "example.person@workexample.com";
      };
    };
  };

  home.file = {
    ".tmuxinator/work.yml".source = ../tmuxinator/work.yml;
  };

  # https://git.gc4.at/linux/ohmyzsh/src/commit/64d881b479cec5e62384176773f1b4d0a057ba47/plugins/keychain
  programs.zsh.oh-my-zsh.extraConfig = ''
    zstyle :omz:plugins:keychain identities id_ed25519 google_compute_engine
  '';

  programs.zsh.initContent = ''
  export PROMPT="[%D{%T}] %n@%m %1~ %# "
  eval $(fnm env)
  '';

}
