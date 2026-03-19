{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
in
{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    # Useful if mason / LSP servers / formatters need tools from PATH
    extraPackages = with pkgs; [
      git
      gcc
      ripgrep
      fd
      unzip
      curl
      wget
      xclip
      wl-clipboard
      fzf
      python3
      python3Packages.pynvim
      python3Packages.python-lsp-server
      rust-analyzer
      rustfmt
      lua-language-server
      tree-sitter
    ];
  };

  xdg.configFile."nvim" = {
    source = create_symlink "${dotfiles}/nvim";
    recursive = true;
  };
}
