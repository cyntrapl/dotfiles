# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{ inputs
, config
, pkgs
, ...
}: {
  imports = [
    ./hardware-configuration.nix
    inputs.home-manager.nixosModules.default
    inputs.aagl.nixosModules.default
  ];
  #boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;
  boot.loader.grub.efiSupport = true;

  programs.nix-ld.enable = true;

  #driver for my wifi usb stick, remove if you dont use that specifically
  boot.extraModulePackages = with config.boot.kernelPackages; [
    rtl88xxau-aircrack
  ];

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Sofia";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  i18n.supportedLocales = [
    "en_US.UTF-8/UTF-8"
    "ja_JP.UTF-8/UTF-8"
  ];

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
      fcitx5-gtk
    ];
  };

  environment.variables = {
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
    SDL_IM_MODULE = "fcitx";
    GLFW_IM_MODULE = "ibus";
  };
  services = {
    xserver = {
      enable = true;
      xkb = {
        variant = "us";
        layout = "";
      };
      windowManager.dwm.enable = true;
    };

    libinput.enable = true;
    displayManager.sddm = {
      enable = true;
      autoNumlock = true;
      wayland.enable = true;
    };

    auto-cpufreq.enable = true;

    usbmuxd.enable = true;

    tailscale.enable = true; #used for ssh server without port forwarding(very cool)

    fprintd.enable = true;
    fprintd.tod.enable = true;
    fprintd.tod.driver = pkgs.libfprint-2-tod1-vfs0090;
  };

  programs.file-roller.enable = true;
  programs.xfconf.enable = true;

  services.gvfs.enable = true;
  services.tumbler.enable = true;
  services.printing.enable = true;
  services.gnome.gnome-keyring.enable = true;

  hardware.pulseaudio.enable = false;
  hardware.opentabletdriver = {
    enable = true;
    daemon.enable = true;
  };
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.cyntrap = {
    isNormalUser = true;
    description = "Cyntrap";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "cyntrap" = import ./home.nix;
    };
  };

  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      xwayland.enable = true;
    };
    fish = {
      enable = true;
      shellInit = "";
      interactiveShellInit = "
      set fish_greeting                       #removes fish help message
      set -Ux LSCOLORS gxfxbEaEBxxEhEhBaDaCaD #makes folder colors not ugly
      ";
      shellAliases = {
        nix-update = "sudo nixos-rebuild switch --flake /home/cyntrap/Nix-Dots#default";
        "..." = "cd ../..";
        nvim = "nix run /home/cyntrap/Nix-Dots/modules/nixvim/ --";
        big = "cd /run/mount/Big/";
        dots = "cd /home/cyntrap/Nix-Dots/";
      };
    };
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    ssh = {
      enableAskPassword = true;
      askPassword = "${pkgs.lxqt.lxqt-openssh-askpass}/bin/lxqt-openssh-askpass";
    };
  };

  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    jetbrains.clion
    neofetch
    swww
    waypaper
    dunst
    libnotify
    coreutils
    cliphist
    wl-clipboard
    cmake
    curl
    rsync
    wget
    ffmpegthumbnailer
    ffmpeg
    swappy
    grim
    slurp
    ueberzug
    graphicsmagick
    ghostscript
    zsh
    kanji-stroke-order-font
    pipewire
    grimblast
    pypy3
    gnome.gnome-disk-utility
    gnome.gnome-software
    gnome.seahorse
    ripgrep
    gnome.eog
    libimobiledevice
    libsecret
    arandr
    tlp

    #fish plugins
    fishPlugins.done

    #dwm
    dmenu

    #weird bug fix
    lxqt.lxqt-openssh-askpass
  ];

  #programs.anime-game-launcher.enable = true; # Adds launcher and /etc/hosts rules
  #programs.anime-games-launcher.enable = true;
  #programs.anime-borb-launcher.enable = true;
  #programs.honkers-railway-launcher.enable = true;
  #programs.honkers-launcher.enable = true;

  fonts.packages = with pkgs; [
    noto-fonts-cjk
  ];

  system.stateVersion = "24.05"; # Did you read the comment?
}
