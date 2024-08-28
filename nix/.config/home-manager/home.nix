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
      aria2
      buf
      bun
      capnproto
      cloudflared
      direnv
      #devenv
      duckdb
      du-dust
      exercism
      fzf
      flyctl
      git
      git-lfs
      go
      golangci-lint
      htop
      iperf
      iredis
      jq
      mkcert
      mongosh
      neovim
      nodejs
      kubectl
      nil
      oapi-codegen
      pgcli
      #protoc-gen-go
      #protoc-gen-go-grpc
      #railway
      ripgrep
      rye
      starship
      smartdns
      tealdeer
      tokei
      # python dev
      pipx
      uv
      # proxies
      clash-meta
      sing-box
      sing-geoip
      sing-geosite
      v2ray
      v2ray-domain-list-community
      v2ray-geoip
      wrk
      yarn
      yamllint
      # echo $HOME/.nix-profile/bin/zsh | sudo tee -a /etc/shells
      #zsh
      zsh-syntax-highlighting
      zsh-completions
      zsh-autosuggestions
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
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  systemd.user.services.clash-meta = {
    Unit = {
      Description = "clash meta";
      After = ["network.target" "NetworkManager.service" "systemd-networkd.service"];
      Wants = "network-online.target";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
    Service = {
      ExecStart = "%h/.nix-profile/bin/clash-meta -d %h/.config/mihomo";
      ExecReload = "/bin/kill -HUP $MAINPID";
      # copied from traefik https://github.com/traefik/traefik/blob/master/contrib/systemd/traefik.service
      # lock down system access
      # prohibit any operating system and configuration modification
      ProtectSystem="strict";
      # create separate, new (and empty) /tmp and /var/tmp filesystems
      PrivateTmp=true;
      # make /home directories inaccessible
      #ProtectHome=true;
      # turns off access to physical devices (/dev/...)
      PrivateDevices=true;
      # make kernel settings (procfs and sysfs) read-only
      ProtectKernelTunables=true;
      # make cgroups /sys/fs/cgroup read-only
      ProtectControlGroups=true;
    };
  };
}
