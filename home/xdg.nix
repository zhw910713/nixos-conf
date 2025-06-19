{ config, ... }: {
  xdg.configFile = {
    "fish".source = ./dotfiles/.config/fish;
    "foot".source = ./dotfiles/.config/foot;
    "fuzzel".source = ./dotfiles/.config/fuzzel;
    "quickshell".source = ./dotfiles/.config/quickshell;
    "code-flags.conf".source = ./dotfiles/.config/code-flags.conf;
    "starship.toml".source = ./dotfiles/.config/starship.toml;
  };

  xdg.dataFile = {
    "fonts".source = ./dotfiles/.local/share/fonts;
  };
}
