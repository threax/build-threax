$scriptPath = Split-Path $script:MyInvocation.MyCommand.Path

Push-Location $scriptPath

docker build -t threax/build-dotnet:10.0 .

Pop-Location