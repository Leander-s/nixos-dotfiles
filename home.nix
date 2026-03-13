{
  inputs,
  config,
  pkgs,
  ...
}:
let
  dotfiles = "${config.home.homeDirectory}/nixos-dotfiles/config";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    hypr = "hypr";
    nvim = "nvim";
    waybar = "waybar";
    mako = "mako";
    ghostty = "ghostty";
    tmux = "tmux";
  };
in
{
  imports = [ inputs.zen-browser.homeModules.twilight ];
  home.username = "leander";
  home.homeDirectory = "/home/leander";
  home.stateVersion = "25.11";

  programs.zen-browser = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "robbyrussell";
    };
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  home.packages = with pkgs; [
    fzf
    hyprshutdown
    hyprlock
    btop
    mako
    tmux
    kdePackages.dolphin
    nodejs
    python3
    python3Packages.pip
    python3Packages.pynvim
    python3Packages.python-lsp-server
    ripgrep
    swaybg
    discord
    brightnessctl
    spotify
    wl-clipboard
    micromamba
    unzip
    rustc
    cargo
    rustfmt
    clippy
    rust-analyzer
    fd
    gh
    google-chrome
    btop
    nwg-look
    papirus-icon-theme
    sshfs-fuse
    vicinae
    nodePackages.typescript
    tree-sitter
    clang-tools
    clang
    lua-language-server
  ];

  programs.git.enable = true;

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
    size = 24;

    gtk.enable = true;
    x11.enable = true;
  };

  home.sessionPath = [
    "$HOME/.local/bin"
    "$HOME/bin"
    "$HOME/prog/workout_tracker"
    "$HOME/go/bin"
  ];
}
