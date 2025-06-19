{ config, pkgs, inputs, username, settings, ... }:
{
  imports = [ 
    ./pkgs.nix 
    ./xdg.nix
    ./conf/hyprconf.nix
    ./conf/theme.nix

    ####  fcitx 中文+日文
    #./conf/fcitx.nix
  ];

  home = {
    username = "${username}";
    homeDirectory = "/home/${username}";
    stateVersion = "25.05";
  };

home.packages = with pkgs; [ 
  home-manager 
];

}
