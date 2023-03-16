{ config, pkgs, lib, ... }:
let
  locale = "en_US.UTF-8";
  homedir = builtins.getEnv "HOME";
  username = builtins.getEnv "USER";
in
{
  home = {
    packages = with pkgs; [
      aria2
      cloudflared
      direnv
      du-dust
      fzf
      flyctl
      git
      go
      golangci-lint
      htop
      iperf
      jq
      mkcert
      neovim
      nodejs
      kubectl
      pgcli
      ripgrep
      starship
      tealdeer
      tokei
      v2ray
      v2ray-domain-list-community
      yarn
      # echo $HOME/.nix-profile/bin/zsh | sudo tee -a /etc/shells
      zsh
      zsh-syntax-highlighting
      zsh-completions
      zsh-autosuggestions
      zsh-history-substring-search
      nix-zsh-completions
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
    stateVersion = "22.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
