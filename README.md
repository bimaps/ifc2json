---
layout: "api"
tags: ifc2json
title: "ifc2json documentation"
permalink: /api/ifc2json
---

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

## Code documentation

Here is the code structure to extract the IFC elements according to the building hierarchy :

```
IfcProject (Project)
 |
 |-IfcSite (Site)
   |
   |-IfcBuilding (Building)
     |
     |-IfcBuildingStorey (Building level)
       |
       |-IfcSpace (Space / room)
	     |
	     |- IfcElement
```



## Compilation

### Build multi-platform

1. Install [.Net Core 3.1](https://dotnet.microsoft.com/download)
2. Start `build.sh` (for MacOS + Linux)


## Library 
### Newtonsoft.Json + MathNet.Spatial + MathNet.Numerics

The packages are installed via the Nuget package manager:

- [Newtonsoft.Json](https://www.nuget.org/packages/Newtonsoft.Json/) : used for generating and reading Json files
- [MathNet](https://www.nuget.org/packages/MathNet.Spatial/) : use to extend geospatial type objects (point 3D, etc.)


## Geometry Gym IFC

The library is the most reliable in the IFC transformation world (also used in Revit, Rhino, etc.)

We compile the library for the [.NET core](https://docs.microsoft.com/en-us/dotnet/core) environment. Originally, this is only for the .NET (Windows) environment.

Source code : [github.com/GeometryGym/GeometryGymIFC](https://github.com/GeometryGym/GeometryGymIFC)


## Compile

Recommendation: use Visual Studio 2019+

1. Hack the file (remove the windows feature) : `/IFC/IFC O.cs`

2. Replace in the file > GeometryGym.Ifc.IfcOrganization (L819).

replace that :

```csharp
#if (!NETSTANDARD2_0)
    string name = ((string)Microsoft.Win32.Registry.GetValue(@"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion", "RegisteredOrganization", "")).Replace("'", "");
    if (!string.IsNullOrEmpty(name) && string.Compare(name, "Microsoft", true) != 0 && string.Compare(name, "HP Inc.",true) != 0)
        return name;
#endif
```

by this :

```csharp
#if (!NETSTANDARD2_0)
    //string name = ((string)Microsoft.Win32.Registry.GetValue(@"HKEY_LOCAL_MACHINE\Software\Microsoft\Windows NT\CurrentVersion", "RegisteredOrganization", "")).Replace("'", "");
    string name = null;
    if (!string.IsNullOrEmpty(name) && string.Compare(name, "Microsoft", true) != 0 && string.Compare(name, "HP Inc.",true) != 0)
        return name;
#endif
```

3. Change Framework : .NET Core 3.1

4. Update Nuget package ``Newtonsoft.Json`

5. Create a file at the root of the folder (update version number) : `AssemblyInfo.cs`

```csharp
using System;
using System.Reflection;

[assembly: System.Reflection.AssemblyCompanyAttribute("GeometryGymIFC")]
[assembly: System.Reflection.AssemblyConfigurationAttribute("Release")]
[assembly: System.Reflection.AssemblyFileVersionAttribute("0.1.09.0")]
[assembly: System.Reflection.AssemblyInformationalVersionAttribute("0.1.09.0")]
[assembly: System.Reflection.AssemblyProductAttribute("GeometryGymIFC")]
[assembly: System.Reflection.AssemblyTitleAttribute("GeometryGymIFC")]
[assembly: System.Reflection.AssemblyVersionAttribute("0.1.09.0")]

```

6. Compile (Any CPU)


7. Copie file in the Ifc2json folder :
    - From `Core\bin\Release\netcoreapp3.1\GeometryGymIFCcore.dll`
    - To `linux` + `macos` + `win`



