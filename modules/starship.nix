{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      format = "$nix_shell$python$username$hostname$directory$git_branch$line_break$character";

      username = {
        show_always = true;
        format = "[$user]($style)@";
      };

      hostname = {
        ssh_only = false;
        format = "[$hostname]($style):";
      };

      directory = {
        truncate_to_repo = false;
        truncation_length = 100;
        format = "[$path]($style) ";
      };

      git_branch.format = "[$symbol$branch]($style) ";
      git_status.disabled = true;

      nix_shell = {
        disabled = false;
        format = "[(\\(name\\))]($style) ";
      };

      cmd_duration.disabled = true;
      package.disabled = true;
      cmake.disabled = true;

      python = {
        disabled = false;
        format = "([\\($virtualenv\\)]($style) )";
      };
    };
  };
}