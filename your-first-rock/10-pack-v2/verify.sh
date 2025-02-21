#!/bin/bash

stat /root/dotnet-webapi/rockcraft.yaml
stat /root/dotnet-webapi/dotnet-webapi_0.2_amd64.rock
docker images | grep dotnet-webapi
docker images | grep "0.2"