### Time to build then run it!

After following previous instructions to write your own `rockcraft.yaml`, Your `rockcraft.yaml` file should look like below.

```yaml
name: dotnet-webapi
# see https://documentation.ubuntu.com/rockcraft/en/1.8.0/explanation/bases/
# for more information about bases and using 'bare' bases for chiselled rocks
base: ubuntu@24.04 # the base environment for this rock
version: '0.1' # just for humans. Semantic versioning is recommended
summary: A simple .NET Web API App # 79 char long summary
description: |
    dotnet-webapi is just a simple rock built from simple 
    .NET Web API App code generated using one of project templates that .NET CLI provides. 
platforms: # the platforms this rock should be built on and run on
    amd64:

environment:
    ASPNETCORE_URLS: http://0.0.0.0:8080

services:
    dotnet-webapi:
        override: replace
        startup: enabled
        command: dotnet dotnet-webapi.dll

parts:
    dotnet-webapi: 
        plugin: nil
        source-type: local
        source: .
        build-environment:
            - PATH: "/usr/bin:${PATH}"
        build-packages:
            - dotnet-sdk-8.0
        override-build: |
            craftctl default
            dotnet restore
            dotnet build 
            dotnet publish -c Release -o ${CRAFT_PART_INSTALL}/
        stage-packages: 
            - aspnetcore-runtime-8.0
```
#### Building a rock
Let's build a rock from this `rockcraft.yaml` file we wrote. Run `rockcraft pack` to build a rock. (To see detailed build logs, use `-v` with the command)

```bash
rockcraft pack -v
```