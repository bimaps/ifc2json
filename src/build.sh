
dotnet publish --runtime ubuntu.18.04-x64 --configuration Release --self-contained false
dotnet publish --runtime osx-x64 --configuration Release --self-contained false
dotnet publish --runtime win-x64 --configuration Release --self-contained false


cp bin/Release/net5.0/ubuntu.18.04-x64/publish/* ../linux/
cp bin/Release/net5.0/osx-x64/publish/* ../macos/
cp bin/Release/net5.0/win-x64/publish/* ../win/

echo Everything is published !

# -c|--configuration {Debug|Release}