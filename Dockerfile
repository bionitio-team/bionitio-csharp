FROM mcr.microsoft.com/dotnet/core/sdk:2.2
WORKDIR /app
RUN apt-get update && apt-get install libunwind8
COPY . ./
RUN dotnet publish -c Release --runtime linux-x64 -o out
RUN cp bionitio/bin/Release/netcoreapp2.0/linux-x64/bionitio /usr/bin/
