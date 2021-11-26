{ config, pkgs, lib, ... }:
let
  locale = "C.UTF-8";
  homedir = builtins.getEnv "HOME";
  username = builtins.getEnv "USER";
in
{
  home = {
    #pkgs
    packages = with pkgs; [
      ripgrep
      antibody
      starship
    ];

    # source $HOME/.nix-profile/etc/profile.d/hm-session-vars.sh
    # if shell program is not managed by home-manager
    sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      LANG = locale;
      LC_ALL = locale;
      TMUX_TMPDIR = "/tmp";
    };

    username = username;
    homeDirectory = homedir;
    stateVersion = "21.11";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  xdg.configFile."starship.toml" = { source = ./starship.toml; };
}
