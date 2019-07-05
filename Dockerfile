FROM mcr.microsoft.com/dotnet/core/sdk:2.2
WORKDIR /app
RUN apt-get update && apt-get install libunwind8
COPY . ./
RUN dotnet publish -c Release --self-contained false -r linux-x64 -o out
RUN ln -s $(realpath bionitio/out/bionitio) /usr/local/bin/
