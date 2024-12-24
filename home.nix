{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "keyzou";
  home.homeDirectory = "/home/keyzou";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  # home.packages = [];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  # home.file = {};

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
  #  /etc/profiles/per-user/keyzou/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "emacs";
    XDG_CONFIG_HOME = "$HOME/.config";
    EZA_CONFIG_DIR = "$XDG_CONFIG_HOME/eza";
    FZF_DEFAULT_OPTS = "$FZF_DEFAULT_OPTS \
      --highlight-line \
      --info=inline-right \
      --ansi \
      --layout=reverse \
      --border=none
      --color=bg+:#2e3c64 \
      --color=bg:#1f2335 \
      --color=border:#29a4bd \
      --color=fg:#c0caf5 \
      --color=gutter:#1f2335 \
      --color=header:#ff9e64 \
      --color=hl+:#2ac3de \
      --color=hl:#2ac3de \
      --color=info:#545c7e \
      --color=marker:#ff007c \
      --color=pointer:#ff007c \
      --color=prompt:#2ac3de \
      --color=query:#c0caf5:regular \
      --color=scrollbar:#29a4bd \
      --color=separator:#ff9e64 \
      --color=spinner:#ff007c \
    ";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    defaultEditor = true;
  };

  programs.zsh = {
    enable = true;
    shellAliases = {
      ls = "eza --color=always --group-directories-first --icons";
      ll = "eza -la --icons --octal-permissions --group-directories-first";
      l = "eza -bGF --header --git --color=always --group-directories-first --icons";
      llm = "eza -lbGd --header --git --sort=modified --color=always --group-directories-first --icons" ;
      la = "eza --long --all --group --group-directories-first";
      lx = "eza -lbhHigUmuSa@ --time-style=long-iso --git --color-scale --color=always --group-directories-first --icons";

      lS = "eza -1 --color=always --group-directories-first --icons";
      lt = "eza --tree --level=2 --color=always --group-directories-first --icons";
    };
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
      ];
    };
    
    syntaxHighlighting = {
      enable = true;
    };

    autosuggestion = {
      enable = true;
    };
  };

  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
    options = ["--cmd cd"];
  };

  programs.git.enable = true;
  programs.git.userName = "keyzou";
  programs.git.userEmail = "keyzou95@gmail.com";
  programs.git.extraConfig = {
    pull = {
      rebase = true;
    };
  };

  programs.ssh.enable = true;

  programs.ripgrep.enable = true;
  programs.jq.enable = true;

  programs.bat = {
    enable = true;
  };

  programs.lazygit = {
    enable = true;
    settings = {
      gui.nerdFontsVersion = "3";
      gui.theme = {
        activeBorderColor = [ "#ff9e64" "bold" ];
        inactiveBorderColor = [ "#29a4bd" ];
        searchingActiveBorderColor = [ "#ff9e64" "bold" ];
        optionsTextColor = [ "#7aa27f" ];
        selectedLineBgColor = [ "#2e3c64" ];
        cherryPickedCommitFgColor = [ "#7aa2f7" ];
        cherryPickedCommitBgColor = [ "#bb9af7" ];
        markedPickedCommitFgColor = [ "#7aa2f7" ];
        markedPickedCommitBgColor = [ "#e0af68" ];
        unstagedChangesColor = [ "#db4b4b" ];
        defaultFgColor = [ "#c0caf5" ];
      };
    };
  };

  programs.eza.enable = true;
  programs.eza.enableZshIntegration = true;

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.mise.enable = true;
  programs.mise.enableZshIntegration = true;

}
