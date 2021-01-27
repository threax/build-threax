FROM mcr.microsoft.com/dotnet/sdk:5.0-focal

#Environment
ENV DOTNET_CLI_TELEMETRY_OPTOUT=1

# Install Node
RUN apt-get update &&\
    apt-get install gnupg -y &&\
    apt-get install curl -y &&\
    curl -sL https://deb.nodesource.com/setup_12.x | bash - &&\
    apt-get install -y nodejs &&\
    apt-get remove --auto-remove curl -y &&\
    apt-get remove --auto-remove gnupg -y &&\
    apt-get autoremove &&\
    apt-get clean

RUN npm install -g typescript &&\
    npm install -g sass &&\
    npm install -g threax-npm-tk