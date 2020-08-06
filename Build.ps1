$scriptPath = Split-Path $script:MyInvocation.MyCommand.Path

docker build -t threax/build-dotnet:3.1.0 $scriptPath