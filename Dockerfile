FROM mcr.microsoft.com/dotnet/core/sdk:2.2
WORKDIR /bionitio

# Dotnet runtime dependency
RUN apt-get update && apt-get install libunwind8
COPY . ./

# This is *not* self-contained, because that means copying the entire runtime to the output directory,
# which we don't need because dotnet is already installed
RUN dotnet publish -c Release --self-contained false -r linux-x64 -o out

# The compilation is run by root, so give everyone access
RUN chmod a+x bionitio/out/bionitio

# Hack to handle the fact that dotnet doesn't like writing to temp directories that are bind mounted
# https://github.com/JetBrains/teamcity-docker-agent/issues/45#issuecomment-436912440
ENV COMPlus_EnableDiagnostics 0

# Symlink bionitio into the PATH
RUN ln -s $(realpath bionitio/out/bionitio) /usr/local/bin/
