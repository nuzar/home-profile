{ config, pkgs, lib, ... }:
let
  locale = "en_US.UTF-8";
  homedir = builtins.getEnv "HOME";
  username = builtins.getEnv "USER";
in
{
  home = {
    username = username;
    homeDirectory = homedir;
    stateVersion = "23.11";

    packages = with pkgs; [
      #aria2
      #buf

      #bun
      #nodejs

      #go
      #golangci-lint

      #capnproto
      #cloudflared
      #direnv
      #devenv
      #duckdb
      #dust
      #exercism
      #fzf
      #flyctl
      #git
      #git-lfs
      #helix
      #htop
      #iperf
      #iredis
      #jq
      #mkcert
      #mongosh
      #neovim
      #kubectl
      #nil
      #oapi-codegen
      #pgcli
      #protoc-gen-go
      #protoc-gen-go-grpc
      #railway
      #ripgrep
      #rye
      #starship
      #smartdns
      #tealdeer
      #tokei
      # python dev
      #uv
      # proxies
      #clash-meta
      #sing-box
      #sing-geoip
      #sing-geosite
      #v2ray
      #v2ray-domain-list-community
      #v2ray-geoip
      #wrk
      #yarn
      #yamllint
      # echo $HOME/.nix-profile/bin/zsh | sudo tee -a /etc/shells
      #zsh
      #zsh-syntax-highlighting
      #zsh-completions
      #zsh-autosuggestions
      #zsh-history-substring-search
      nix-zsh-completions
      #graphviz
      #doh-proxy-rust
      #q

      #zig
      #zls
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
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}

