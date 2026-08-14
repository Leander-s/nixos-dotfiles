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

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };

  programs.zen-browser = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "fzf"
        "gh"
        "rust"
        "ssh"
        "systemd"
        "tmux"
      ];
      theme = "robbyrussell";
    };
    shellAliases = {
      rnvim = "devcontainer exec --workspace-folder . nvim";
      rbuild = "devcontainer exec --workspace-folder . ./scripts/build_no_cuda.sh";
    };
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  home.packages = with pkgs; [
    jq
    unzip
    rustc
    cargo
    kdePackages.dolphin
    nodejs
    python3
    python3Packages.pip
    ripgrep
    discord
    spotify
    micromamba
    clippy
    gh
    claude-code
    sshfs-fuse
    nodePackages.typescript
    clang-tools
    clang
    lazygit
  ];

  programs.git = {
    enable = true;
    settings = {
      user.name = "Leander Funken";
      user.email = "leander.funken@gmail.com";
      credential.helper = "store";
      init.defaultBranch = "main";
    };
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
