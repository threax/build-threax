FROM mcr.microsoft.com/dotnet/core/sdk:3.1

#Environment
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1

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

RUN npm install -g typescript &&\
    npm install -g sass &&\
    npm install -g threax-npm-tk

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