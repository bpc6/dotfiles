{ config, pkgs, ... }:

{
  home.packages = [pkgs.coreutils pkgs.lesspipe ];

  programs.bash = {
    enable = true;
    historyControl = [ "ignoreboth" ];
    historyFileSize = 2000;
    historySize = 1000;

    shellAliases = {
      ll = "ls -alF";
      la = "ls -A";
      l = "ls -CF";

      ls = "ls --color=auto";
      grep = "grep --color=auto";
      fgrep = "fgrep --color=auto";
      egrep = "egrep --color=auto";
    };

    shellOptions = [ "histappend" "checkwinsize" ];

    sessionVariables = {
      TZ = "America/Denver";
    };

    initExtra = ''
      eval "$(SHELL=/bin/sh lesspipe.sh)"
      eval "$(dircolors -b)"
      bind 'set bell-style none'
    '';
  };
}
