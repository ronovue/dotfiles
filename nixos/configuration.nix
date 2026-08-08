{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
  ];

  environment.systemPackages = with pkgs; [
    git
    fastfetch
    kitty
    gedit
    hyprpaper
    hypridle
    hyprlock
    hyprshot
    hyprpolkitagent
    networkmanagerapplet
    xarchiver
    thunar-archive-plugin
    thunar-volman
    nwg-look
    colloid-gtk-theme
    tela-icon-theme
    wofi
    qview
    brightnessctl
    libnotify
    swaynotificationcenter
    vlc
    gammastep
    btop
    playerctl
    pavucontrol
    chromium
  ];
  
  programs.hyprland.enable = true;
  programs.firefox.enable = true;
  programs.waybar.enable = true;
  programs.thunar.enable = true;
  programs.xfconf.enable = true;
  
  services.blueman.enable = true;
  services.gvfs.enable = true;
  services.tumbler.enable = true;
  services.udisks2.enable = true;
  services.pipewire.enable = true;

  networking.hostName = "nixos";
  networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  time.timeZone = "Asia/Kolkata";
  security.rtkit.enable = true;  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.systemd.enable = true;
  boot.resumeDevice = "/dev/disk/by-uuid/fb9d2b42-a5f3-4939-b71a-24e701bdeed5";
  swapDevices = [
    { device = "/dev/disk/by-uuid/fb9d2b42-a5f3-4939-b71a-24e701bdeed5"; }
  ];
  
  users.users.ronak = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.zsh;
  };

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    noto-fonts-color-emoji
    nerd-fonts.symbols-only
    inter
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
    monospace = [ "JetBrainsMono Nerd Font" ];
    sansSerif = [ "JetBrainsMono Nerd Font" ];
    serif = [ "JetBrainsMono Nerd Font" ];
    emoji = [ "Noto Color Emoji" ];
    };
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh.enable = true;
    histSize = 10000;
    histFile = "$HOME/.zsh_history";
    setOptions = [
      "HIST_IGNORE_ALL_DUPS"
    ];
    shellAliases = {
      config = "gedit /etc/nixos/configuration.nix";
      rebuild = "sudo nixos-rebuild switch";
    };
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
  };

  system.stateVersion = "26.05";
}
