FROM mcr.microsoft.com/dotnet/core/sdk:2.2
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY test/*.csproj test/
RUN dotnet restore test
COPY bionitio/*.csproj bionitio/
RUN dotnet restore bionitio

# Copy everything else and build
COPY . ./
RUN dotnet publish -c Release -o out