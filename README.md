
## ConvertIfc2Json


Convert IFC 2 Json is a .net Core Library based on [GeometryGymIFC](https://github.com/GeometryGym/GeometryGymIFC).

Requirements: The [.Net Core 3.1](https://dotnet.microsoft.com/download) must be installed.

### Quickstart

Run commande
```
./ConvertIfc2Json sourcefile.ifc
```

Run commande with output name
```
./ConvertIfc2Json sourcefile.ifc output.json
```

If you don't specify an output name, the name of the Json result file will be "sourcefile.ifc.json". 


### Parameter

`--indented` : if you add this parameter the json will be Formated.
`--full` : if you add this parameter all the IFC will be returned in Json format.
`--version` : display version number

### Compile

1. Install [.Net Core 3.1](https://dotnet.microsoft.com/download)
2. Start `build.sh` (for MacOS + Linux)

