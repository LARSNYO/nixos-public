{ buildDotnetGlobalTool, lib }:
let 
    dotnet-aspnet-codegenerator = buildDotnetGlobalTool {
        pname = "dotnet-aspnet-codegenerator";
        version = "9.0.0";
        nugetHash = "sha256-BTOpf51sLXNQEobzRIsiCsVIBCIhLeyDeZrMJqiMp4c=";
    };
    
in {
    dotnet-aspnet-codegenerator = dotnet-aspnet-codegenerator;
}