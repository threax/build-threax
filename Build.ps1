$scriptPath = Split-Path $script:MyInvocation.MyCommand.Path

docker build -t threax/build-dotnet:5.0 $scriptPath