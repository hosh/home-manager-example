{ config, pkgs, ... }:

{
  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')

    # Get coreutils with the 'g' prefix. We can then alias those, such as
    # alias ls="gls --color"
    coreutils-prefixed
    bash

    vim

    htop
    btop
    tmux
    # Tmuxinator can create tmux sessions with pre-defined windows and panes
    # tmuxinator

    ripgrep
    jq
    yq

    keychain
    # mosh

    #kubectl
    #k9s
  ];

  home.shellAliases = {
    ls = "gls --color=auto";
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
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
    ".spacemacs".source = spacemacs/spacemacs;
    ".iex.exs".source = elixir/iex.exs;
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/hhh/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    EDITOR = "vim";
    LS_COLORS = "";
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "keychain"
        # "branch"
      ];
    };

    # Override oh-my-zsh in .zshrc
    # [Hosh] I like the "horrible" blue color :-p
    initContent = ''
      export LS_COLORS=""
    '';

    # Add this in Macs, but it doesn't always work
    # defaults write -g ApplePressAndHoldEnabled -bool true
  };

  # Disable copyApps on macOSX
  targets.darwin.copyApps.enable = false;
}
