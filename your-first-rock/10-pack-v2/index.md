### Running your second rock

Let's build and run your second rock with the `rockcraf.yaml` that looks like below.

```yaml
name: dotnet-webapi
# see https://documentation.ubuntu.com/rockcraft/en/1.8.0/explanation/bases/
# for more information about bases and using 'bare' bases for chiselled rocks
base: bare # the base environment for this rock
build-base: ubuntu@24.04
version: '0.2' # just for humans. Semantic versioning is recommended
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
        plugin: dotnet
        source-type: local
        source: .
        build-environment:
            - PATH: "/usr/bin:${PATH}"
        build-packages:
            - dotnet-sdk-8.0
        stage-packages: 
            - aspnetcore-runtime-8.0_libs
```

Let's pack then run using the same commands we used before.

```bash
rockcraft pack -v
sudo rockcraft.skopeo --insecure-policy copy oci-archive:dotnet-webapi_0.2_amd64.rock docker-daemon:dotnet-webapi:0.2
sudo docker run -p 8080:8080 dotnet-webapi:0.2
```

Then check if the rock (container) with .NET app runs properly by clicking links below.
- [http://0.0.0.0:8080/weatherforecast]({{TRAFFIC_HOST1_8080}}/weatherforecast)
- [http://0.0.0.0:8080/swagger]({{TRAFFIC_HOST1_8080}}/swagger)

#### Compare sizes of 2 rocks
Now let's compare sizes of 2 rocks.
```bash
ls -l --block-size=MB *.rock
```

You can see `0.2` is smaller as it's built on bare base and includes chiseled package as dependency.
```bash
-rw-r--r-- 1 root root 103MB Feb 21 16:35 dotnet-webapi_0.1_amd64.rock
-rw-r--r-- 1 root root  71MB Feb 21 16:38 dotnet-webapi_0.2_amd64.rock
```