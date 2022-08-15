{ config, pkgs, lib, ... }:
let
  locale = "en_US.UTF-8";
  homedir = builtins.getEnv "HOME";
  username = builtins.getEnv "USER";
in
{
  home = {
    packages = with pkgs; [
      #antibody
      direnv
      fzf
      gitFull
      go
      htop
      neovim
      ripgrep
      rnix-lsp
      starship
      v2ray
      v2ray-domain-list-community
      zplug
      # echo $HOME/.nix-profile/bin/zsh | sudo tee -a /etc/shells
      #zsh
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
