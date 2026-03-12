{ config, pkgs, ... }:
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
  home.username = "leander";
  home.homeDirectory = "/home/leander";
  home.stateVersion = "25.11";

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
    nil
    nixpkgs-fmt
    vicinae
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
