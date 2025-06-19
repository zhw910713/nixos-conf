{ config, pkgs, inputs, ...}:let

  python-packages = pkgs.python3.withPackages (
    ps:
      with ps; [
        kde-material-you-colors
        ]
    );

in 
{
  nixpkgs.config.allowUnfree = true;

  home.packages = (with pkgs; [
    btrfs-progs
    cliphist
    fastfetch
    firefox
    git
    glib
    mpv
    swww
    vscode
    wl-clipboard
    xdg-utils
    xdg-user-dirs
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-volman
    xfce.tumbler
    wpsoffice-cn
    wf-recorder
    hyprshot
    slurp
    foot
    fish
    starship
    imagemagick
    jq
    brightnessctl
    cava
    pamixer
    pavucontrol
    playerctl
    bc
    gnome-keyring
    swappy
    upower
    ydotool
    wlogout

    ## game
    lutris
    wineWow64Packages.stagingFull

    ## hypr
    hypridle
    hyprlock
    hyprutils
    hyprpicker
    hyprlang
    hyprland-qt-support
    hyprland-qtutils
    hyprcursor
    hyprwayland-scanner

    ## quickshell
    quickshell
    kdePackages.qt5compat
    kdePackages.syntax-highlighting
    kdePackages.kdialog
    kdePackages.polkit-kde-agent-1
    kdePackages.systemsettings
    matugen
    fontconfig
    fuzzel
    translate-shell

    #### fonts dotfile文件夹有中文字体和系统托盘字体
    #

  ]) ++ [
	  python-packages
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [  
      pkgs.xdg-desktop-portal-hyprland
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = pkgs.hyprland;
  };

}
