{
  config,
  lib,
  pkgs,
  inputs,
  hostname,
  username,
  settings,
  ...
}:

{
  imports = [
    ./hardware.nix
  ];

  nixpkgs.config.allowUnfree = true;

  boot.loader = {
    grub = {
      enable = true;
      device = "nodev";
      efiSupport = true;
    };
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot/efi";
    };
    timeout = 2;
  };

  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "systemd.mask=systemd-vconsole-setup.service"
      "systemd.mask=dev-tpmrm0.device"
      "nowatchdog" 
      "modprobe.blacklist=iTCO_wdt"
      "nouveau.modeset=0"
    ];

    tmp = {
      useTmpfs = false;
      tmpfsSize = "30%";
    };    

  };

  #services.xserver.videoDrivers = [ "nvidia" ];
  
  #### nvidia显卡
  #boot.initrd.kernelModules = [ "nvidia" ];
  #hardware.graphics = {
  #  enable = true;
  #  enable32Bit = true;
  #  extraPackages = with pkgs; [
  #    vaapiVdpau
  #    libvdpau
  #    libvdpau-va-gl 
  #    nvidia-vaapi-driver
  #    vdpauinfo
  #    libva
  #    libva-utils	
  #  ];
  #};
  #hardware.nvidia = {
  #  modesetting.enable = true;      
  #  powerManagement.enable = false;
  #  powerManagement.finegrained = false;
  #  nvidiaPersistenced = false;
  #  open = false;
  #  nvidiaSettings = true;
  #  package = config.boot.kernelPackages.nvidiaPackages.latest;
  #};
  
  #### 罗技无线外设
  #hardware = { 
  #   logitech.wireless.enable = false;
  #  logitech.wireless.enableGraphical = false;
  #}; 
  networking.hostName = "${hostname}"; 

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Shanghai";

  i18n.defaultLocale = "zh_CN.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "zh_CN.UTF-8";
    LC_IDENTIFICATION = "zh_CN.UTF-8";
    LC_MEASUREMENT = "zh_CN.UTF-8";
    LC_MONETARY = "zh_CN.UTF-8";
    LC_NAME = "zh_CN.UTF-8";
    LC_NUMERIC = "zh_CN.UTF-8";
    LC_PAPER = "zh_CN.UTF-8";
    LC_TELEPHONE = "zh_CN.UTF-8";
    LC_TIME = "zh_CN.UTF-8";
  };

  #### swap设置 没有swap分区或者swapfile文件不要启用 
  #zramSwap = {
  #  enable = true;
  #  priority = 100;
  #  memoryPercent = 30;
  #  swapDevices = 1;
  #  algorithm = "zstd";
  #};

  users.users."${username}" = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "networkmanager"
      "libvirtd"
      "docker"
      "video"
    ]; 
  };
  
  nix = {
    settings.substituters = [
      "https://mirror.sjtu.edu.cn/nix-channels/store"
      "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];
    settings.trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" 
    ];
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };

  services = {
    xserver.enable = false;
    greetd = {
      enable = true;
      vt = 3;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet  --cmd Hyprland"; # start Hyprland with a TUI login manager
        };
      };
    };
	  gvfs.enable = true;
	  tumbler.enable = true;
    dbus.enable = true; 
  };

  qt.enable = true;
  programs.dconf.enable =  true;

  virtualisation = {
    docker = {
      enable = true;
      daemon.settings = {
        registry-mirrors = [
          "https://docker.domys.cc" 
        ];
      };
    };
  };
  
	services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
	  wireplumber.enable = true;
  };

  security.pam.services.swaylock = {
    text = ''
      auth include login
    '';
  };

  environment.systemPackages = with pkgs; [
    home-manager
  ];
  
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  system.stateVersion = "25.05";

}
