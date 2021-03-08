
dotnet publish --runtime ubuntu.18.04-x64 --configuration Release --self-contained false
dotnet publish --runtime osx-x64 --configuration Release --self-contained false
dotnet publish --runtime win-x64 --configuration Release --self-contained false


cp bin/Release/netcoreapp3.1/ubuntu.18.04-x64/publish/* ../linux/
cp bin/Release/netcoreapp3.1/osx-x64/publish/* ../macos/
cp bin/Release/netcoreapp3.1/win-x64/publish/* ../win/

echo Everything is published !

# -c|--configuration {Debug|Release}