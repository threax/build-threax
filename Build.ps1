$scriptPath = Split-Path $script:MyInvocation.MyCommand.Path

Push-Location $scriptPath

wsl sudo docker build -t threax/build-dotnet:6.0 .

Pop-Location