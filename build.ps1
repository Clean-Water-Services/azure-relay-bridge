#!/usr/local/bin/pwsh

if ((Test-Path .\build)) { Remove-Item -r -fo .\build }
New-Item -ItemType Directory .\build | Out-Null

foreach ($runtime in @("osx-arm64", "osx-x64", "win-x64")) {
    dotnet publish ./azbridge/azbridge.csproj -r $runtime -c Release --self-contained true -p:PublishSingleFile=true -o ./build/$runtime
    Remove-Item ./build/$runtime/*.pdb
}
