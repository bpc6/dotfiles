{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    neovim
    gcc
    ripgrep
    fd
    fzf
    lazygit
    tree-sitter
    statix
    nil
  ];

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";
}
