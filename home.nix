{ config, pkgs, ... }:
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
    ];

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

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      aws = { disabled = true; };
      battery = { disabled = true; };
      directory = { 
        truncation_length = 0;
        truncate_to_repo = false;
      };
      git_branch = {
        format = "[$symbol$branch]($style) ";
      };
      golang = { disabled = true; };
      nodejs = { disabled = true; };
      package = { disabled = true; };
      python = {
        pyenv_version_name = true;
      };
      rust = { disabled = true; };
    };
  };
}
