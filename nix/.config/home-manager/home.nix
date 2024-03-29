{ config, pkgs, lib, ... }:
let
  locale = "en_US.UTF-8";
  homedir = builtins.getEnv "HOME";
  username = builtins.getEnv "USER";
in
{
  home = {
    packages = with pkgs; [
      #aria2
      buf
      bun
      clash-meta
      cloudflared
      #direnv
      du-dust
      exercism
      #fzf
      #flyctl
      #git
      #go
      golangci-lint
      #htop
      #iperf
      #jq
      mkcert
      #neovim
      #nodejs
      #kubectl
      ollama
      #pipx
      #pgcli
      #protoc-gen-go
      #protoc-gen-go-grpc
      #railway
      #ripgrep
      rye
      #starship
      #tealdeer
      #tokei
      uv
      v2ray
      v2ray-domain-list-community
      v2ray-geoip
      wrk
      #yarn
      # echo $HOME/.nix-profile/bin/zsh | sudo tee -a /etc/shells
      #zsh
      #zsh-syntax-highlighting
      zsh-completions
      #zsh-autosuggestions
      zsh-history-substring-search
      nix-zsh-completions
      graphviz
      #doh-proxy-rust
      q
      zig
      zls
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
