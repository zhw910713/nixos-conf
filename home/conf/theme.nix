####ls命令查看主题名
#ls $(nix-build '<nixpkgs>' -A rose-pine-gtk-theme --no-out-link)/share/themes
#ls $(nix-build '<nixpkgs>' -A rose-pine-icon-theme --no-out-link)/share/icons

{ pkgs, ... }:

{
  home.pointerCursor = {
    hyprcursor.enable = true;
    hyprcursor.size = 20;
    package = pkgs.rose-pine-hyprcursor;
    name = "rose-pine-hyprcursor";
    size = 24;
  };


  gtk = {
    enable = true;
    theme = {
      name = "rose-pine-moon";
      package = pkgs.rose-pine-gtk-theme;
    };
    iconTheme = {
      name = "rose-pine-moon";
      package = pkgs.rose-pine-icon-theme;
    };
    cursorTheme = {
      name = "rose-pine-hyprcursor";
      package = pkgs.rose-pine-hyprcursor;
      size = 24;
    };
  };
}
