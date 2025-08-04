{pkgs, ...}: {
    home.packages = with pkgs; [
        htop
        google-chrome
        telegram-desktop
        neofetch
        spotify
        docker_28
    ];
}