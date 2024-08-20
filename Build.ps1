$scriptPath = Split-Path $script:MyInvocation.MyCommand.Path

Push-Location $scriptPath

docker build -t threax/build-dotnet:8.0 .

Pop-Location