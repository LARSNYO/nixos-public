{ pkgs, ... }:
let
    nugetPackages = import ./nuget.nix {
        buildDotnetGlobalTool = pkgs.dotnetCorePackages.buildDotnetGlobalTool;
        lib = pkgs.lib;
    };

    dotnetPkgs = pkgs.dotnetCorePackages;
    combinedDotnet = dotnetPkgs.combinePackages [
        dotnetPkgs.sdk_9_0-bin
        dotnetPkgs.runtime_8_0-bin
    ];

in {
    home.packages = [
        combinedDotnet
        pkgs.dotnet-ef
        nugetPackages.dotnet-aspnet-codegenerator
    ];
}