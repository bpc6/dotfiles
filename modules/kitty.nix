{ config, pkgs, ... }:

{
  home.packages = [pkgs.nerd-fonts.jetbrains-mono ];

  programs.kitty = {
    enable = true;
    
    package = pkgs.writeShellScriptBin "kitty" ''
      exec ${config.home.homeDirectory}/.local/kitty.app/bin/kitty "$@"
    '';

    font = {
      name = "JetBrainsMonoNL Nerd Font Mono";
      size = 15.0;
    };

    themeFile = "OneDark";

    shellIntegration.mode = "no-cursor";

    settings = {
      scrollback_lines = 10000;
      confirm_os_window_close = 0;
      update_check_interval = 0;

      cursor_shape = "block";

      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      copy_on_select = "clipboard";
      clipboard_control = "write-clipboard write-primary";

      enable_audio_bell = "no";
    };
  };


  xdg.desktopEntries.kitty = {
    name = "Kitty";
    exec = "${config.home.homeDirectory}/.local/kitty.app/bin/kitty";
    terminal = false;                    # kitty IS the terminal — don't wrap
    categories = [ "System" "TerminalEmulator" ];
    comment = "Kitty terminal emulator";
    icon = "${config.home.homeDirectory}/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png";
  };
}

