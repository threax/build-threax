FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install wget -y

RUN wget -q https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb
RUN dpkg -i packages-microsoft-prod.deb
RUN apt-get install apt-transport-https -y
RUN apt-get update
RUN apt-get install dotnet-sdk-2.1 -y

RUN apt-get install gnupg -y
RUN apt-get install curl -y
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs

RUN npm install --global yarn
RUN yarn global add typescript
RUN yarn global add threax-npm-tk
