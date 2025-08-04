{ ... }: {
    nixpkgs.config.allowUnfree = true;
    imports = [
        ./programs.nix
        ./dev/dev.nix
    ];

    programs = {
        home-manager.enable = true;
    };
}