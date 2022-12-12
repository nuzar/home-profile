{ config, pkgs, lib, ... }:
let
  locale = "en_US.UTF-8";
  homedir = builtins.getEnv "HOME";
  username = builtins.getEnv "USER";
in
{
  home = {
    packages = with pkgs; [
      antibody
      cloc
      direnv
      fzf
      git
      go
      htop
      mkcert
      neovim
      kubectl
      pgcli
      ripgrep
      rnix-lsp
      starship
      tealdeer
      v2ray
      v2ray-domain-list-community
      yarn
      zplug
      # echo $HOME/.nix-profile/bin/zsh | sudo tee -a /etc/shells
      zsh
      graphviz
    ];

    # source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
    # if shell program is not managed by home-manager
    #sessionVariables = {
    #  EDITOR = "nvim";
    #  VISUAL = "nvim";
    #  LANG = locale;
    #  LC_ALL = locale;
    #  TMUX_TMPDIR = "/tmp";
    #};

    username = username;
    homeDirectory = homedir;
    stateVersion = "22.05";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
