FROM mcr.microsoft.com/dotnet/core/sdk:2.1
WORKDIR /bionitio
#COPY . .

# copy csproj and restore as distinct layers
COPY *.sln .
COPY bionitio/*.csproj ./bionitio
RUN dotnet restore

COPY . .
RUN dotnet publish --runtime linux-x64
ENV PATH "/bionitio/bin/Debug/netcoreapp2.0/linux-x64/publish/bionitio:${PATH}"
