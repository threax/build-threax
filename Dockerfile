FROM ubuntu:18.04

#Environment
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1

# Install Docker Binaries
RUN apt-get update &&\
    apt-get install wget -y &&\
    apt-get install apt-transport-https -y &&\
    wget -q https://download.docker.com/linux/static/stable/x86_64/docker-18.09.1.tgz &&\
    mkdir docker &&\
    tar xzvf docker-18.09.1.tgz -C docker &&\
    cp docker/docker/* /usr/bin/ &&\
    rm -r docker &&\
    apt-get remove --auto-remove apt-transport-https -y &&\
    apt-get remove --auto-remove wget -y &&\
    apt-get autoremove &&\
    apt-get clean

# Install Node
RUN apt-get update &&\
    apt-get install gnupg -y &&\
    apt-get install curl -y &&\
    curl -sL https://deb.nodesource.com/setup_10.x | bash - &&\
    apt-get install -y nodejs &&\
    apt-get remove --auto-remove curl -y &&\
    apt-get remove --auto-remove gnupg -y &&\
    apt-get autoremove &&\
    apt-get clean

# Install .Net Core
RUN apt-get update &&\
    apt-get install wget -y &&\
    apt-get install apt-transport-https -y &&\
    wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb &&\
    dpkg -i packages-microsoft-prod.deb &&\
    apt-get update &&\
    apt-get install dotnet-sdk-3.1 -y &&\
    apt-get remove --auto-remove apt-transport-https -y &&\
    apt-get remove --auto-remove wget -y &&\
    apt-get autoremove &&\
    apt-get clean

# Install npm Packages, node-sass needs --unsafe-perm to keep the user as root when installing
RUN npm install -g typescript
RUN npm install -g --unsafe-perm threax-npm-tk

# Install Extra Nuget Packages
RUN mkdir dlproj &&\
    cd /dlproj &&\
    dotnet new console &&\
    dotnet add dlproj.csproj package Threax.AspNetCore.Halcyon.Ext &&\
    dotnet add dlproj.csproj package Threax.AspNetCore.CSP &&\
    dotnet add dlproj.csproj package Threax.AspNetCore.BuiltInTools &&\
    dotnet add dlproj.csproj package Threax.AspNetCore.Tracking &&\
    dotnet add dlproj.csproj package Threax.AspNetCore.Models &&\
    dotnet add dlproj.csproj package Threax.AspNetCore.IdServerMetadata.Client &&\
    dotnet add dlproj.csproj package Threax.AspNetCore.AuthCore &&\
    dotnet add dlproj.csproj package Threax.AspNetCore.Xsrf &&\
    dotnet add dlproj.csproj package Threax.ReflectedServices &&\
    dotnet add dlproj.csproj package Threax.Tests &&\
    dotnet add dlproj.csproj package Threax.AspNetCore.UserBuilder &&\
    dotnet add dlproj.csproj package Threax.AspNetCore.UserBuilder.Entities &&\
    dotnet add dlproj.csproj package Threax.AspNetCore.UserBuilder.Entities.Mvc &&\
    dotnet add dlproj.csproj package Threax.AspNetCore.ExceptionFilter &&\
    dotnet add dlproj.csproj package Threax.AspNetCore.CorsManager &&\
    dotnet add dlproj.csproj package Threax.AspNetCore.Validators &&\
    dotnet add dlproj.csproj package Threax.AspNetCore.FileRepository &&\
    dotnet add dlproj.csproj package Threax.Extensions.Configuration.SchemaBinder &&\
    dotnet add dlproj.csproj package Threax.SharedHttpClient &&\
    cd .. &&\
    rm -r dlproj