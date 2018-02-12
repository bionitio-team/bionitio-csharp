* Install the [DotNet SDK](https://www.microsoft.com/net/learn/get-started/)
* `cd $BIONITIO_CODE/bionitio`

## Build an executable on OS X, and then run

* `dotnet publish -c Release --runtime osx-x64 --self-contained`
* `./bin/Release/netcoreapp2.0/osx-x64/bionitio -h`

## Build an executable on Linux, and then run

* `dotnet publish -c Release --runtime linux-x64`
* `./bin/Release/netcoreapp2.0/linux-x64/bionitio -h`
