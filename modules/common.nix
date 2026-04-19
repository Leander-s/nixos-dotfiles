{ config, pkgs, lib, ... }: {
  # Boot stuff
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.efi.efiSysMountPoint = "/boot";

  # Hardware stuff
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Networking
  networking.hostName = "leander";
  networking.networkmanager.enable = true;
  networking.networkmanager.wifi.powersave = false;

  # Config stuff
  # Set your time zone.
  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    keyMap = "de";
  };

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  services.xserver = {
    enable = true;
    autoRepeatDelay = 200;
    autoRepeatInterval = 35;
  };

  # Configure keymap in X11
  services.xserver.xkb.layout = "de";

  # Enable sound.
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;
  programs.zsh.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.leander = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [
      tree
    ];
  };

  security.sudo.wheelNeedsPassword = true;

  programs.firefox.enable = true;

  nixpkgs.config.allowUnfree = true;

  # Screen stuff
  services.displayManager.ly.enable = true;
  services.displayManager.defaultSession = "start-hyprland";
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  # List packages installed in system profile.
  environment.systemPackages = with pkgs; [
    hyprland
    waybar
    hyprpaper
    neovim
    vim
    gcc
    wget
    curl
    git
    ghostty
    zsh
    networkmanagerapplet
    pavucontrol
  ];

  # Fonts
  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts-color-emoji
    ];
    fontconfig = {
      enable = true;
      defaultFonts = {
        sansSerif = [ "Noto Sans" ];
        serif = [
          "Noto Serif"
          "DejaVu Serif"
        ];
        monospace = [ "JetBrains Mono" ];
        emoji = [ "Noto Color Emoji" ];
      };
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.openssh.settings.PasswordAuthentication = false;
  services.openssh.settings.KbdInteractiveAuthentication = false;
}

