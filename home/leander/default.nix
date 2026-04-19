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
    waybar = "waybar";
    mako = "mako";
    ghostty = "ghostty";
    tmux = "tmux";
  };
in
{
  imports = [
    inputs.zen-browser.homeModules.twilight
    ../../modules/home-manager/nvim.nix
    ../../modules/home-manager/work.nix
  ];
  home.username = "leander";
  home.homeDirectory = "/home/leander";
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;

  programs.zen-browser = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "fzf" "gh" "rust" "ssh" "systemd" "tmux" ];
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
    python3Packages.pip
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
    clippy
    gh
    google-chrome
    btop
    nwg-look
    papirus-icon-theme
    sshfs-fuse
    vicinae
    nodePackages.typescript
    clang-tools
    clang
  ];

  programs.git = {
  	enable = true;
	settings.user.name = "Leander Funken";
	settings.user.email = "leander.funken@gmail.com";
	settings.credential.helper = "store";
  };

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
