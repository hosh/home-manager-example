{ config, pkgs, lib, ... }:

{
  # The home.packages option allows you to install Nix packages into your
  # environment.
  #home.packages = with pkgs; [
  #];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  config.home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    ".config/git/ignore".source = git/ignore;
    ".tmux.conf".source = tmux/tmux.conf;
    # ".spacemacs".source = spacemacs/spacemacs;
    # ".iex.exs".source = elixir/iex.exs;
  };

  # Let Home Manager install and manage itself.
  config.programs.home-manager.enable = true;

  config.programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };

  config.programs.bash.enable = true;

  # The files in environments/*.nix has additional
  # configs that are composed with these. This includes
  # the git identities. One useful config pattern separates
  # personal and work git identities.
  config.programs.git = {
    enable = true;
    includes = [
      { path = git/common.config; }
      { path = git/personal.config; }
    ];
  };


  # Define a list of unfree packages
  # This option is used by other modules to add non-free packages
  options.my-allowed-unfree = lib.mkOption {
    type = lib.types.listOf lib.types.str;
    default = [];
  };

  config.nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) config.my-allowed-unfree;
}
