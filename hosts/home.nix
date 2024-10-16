{ inputs
, config
, pkgs
, ...
}: {
  home.username = "cyntrap";
  home.homeDirectory = "/home/cyntrap";

  imports = [
    ../modules/terminal/kitty.nix
    ../modules/launcher/fuzzel.nix
    ../modules/hyprland/hyprland.nix
    ../modules/explorer/lf.nix
    ../modules/explorer/bat.nix
    ../modules/themes/gtk.nix
    ../modules/widgets/ags.nix
    ../modules/spicetify/spicetify.nix
    ../modules/video/mpv.nix
  ];
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    #general
    brave
    sublime
    libreoffice
    qbittorrent
    pavucontrol
    htop
    unrar
    arrpc
    (vesktop.override {
      withSystemVencord = false;
    })
    wlr-randr
    cmake
    sutils
    wireshark
    anydesk
    bluez
    obsidian
    brightnessctl
    powertop
    auto-cpufreq

    #gaming
    heroic
    gamescope
    mangohud
    r2modman
    clonehero

    #weeb
    anup
    memento
    adl
    ani-cli
    animdl
    trackma

    #audio and video
    easyeffects
    rnnoise
    deepfilternet
    obs-studio
    obs-studio-plugins.obs-replay-source

    #file manager
    gnome.nautilus

    #development
    jetbrains-toolbox
    sublime
    unityhub
    temurin-jre-bin-17
    dotnet-runtime

    (wineWowPackages.full.override {
      wineRelease = "staging";
      mingwSupport = true;
    })
    winetricks

  ];

  programs.lazygit.enable = true;
  programs.git = {
    enable = true;
    userName = "Cyntrap";
    userEmail = "cyntrapg@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    TERMINAL = "kitty";
    SSH_ASKPASS = "${pkgs.lxqt.lxqt-openssh-askpass}/bin/lxqt-openssh-askpass";
    SSH_AUTH_SOCK = "/run/user/1000/keyring/ssh";
  };

  nixpkgs.config.allowUnfree = true;
  programs.home-manager.enable = true;
}
