#!/bin/bash

stat /root/dotnet-webapi/rockcraft.yaml
cat /root/dotnet-webapi/rockcraft.yaml | grep "base: bare"
cat /root/dotnet-webapi/rockcraft.yaml | grep "plugin: dotnet"
cat /root/dotnet-webapi/rockcraft.yaml | grep "dotnet-build-configuration: Release"
cat /root/dotnet-webapi/rockcraft.yaml | grep "- aspnetcore-runtime-8.0_libs"