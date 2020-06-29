$scriptPath = Split-Path $script:MyInvocation.MyCommand.Path

Push-Location $scriptPath
try{
    docker build -t threax/build-dotnet:3.1.0 .
}
finally{
    Pop-Location
}