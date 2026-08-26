{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;

    settings.user = {
      email = "bpc6@vt.edu";
      name = "Bryan Covell";
    };

    iniContent = {
      init.defaultBranch = "main";
    };

    settings.pull.rebase = true;
  };

  home.sessionVariables.EDITOR = "nvim";
}
