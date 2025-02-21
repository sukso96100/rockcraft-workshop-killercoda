#!/bin/bash

stat /root/dotnet-webapi/rockcraft.yaml
cat /root/dotnet-webapi/rockcraft.yaml | grep "version: '0.2'"
cat /root/dotnet-webapi/rockcraft.yaml | grep "base: bare"