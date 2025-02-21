### Using plugin

Rockcraft provides various plugins for a number of different programming languages, frameworks, and build tools. So that you can easily build rock for your application.

In this workshop, Let's try out [.NET plugin](https://documentation.ubuntu.com/rockcraft/en/stable/common/craft-parts/reference/plugins/dotnet_plugin.html)

To use .NET plugin on part, simply start by setting `plugin` as `dotnet.

```yaml
...
parts:
    dotnet-webapi: 
        plugin: dotnet
        ...
...
```
Then, let's also add `dotnet-build-configuration` with value `Release` which is a property provided by .NET plugin. This will make sure to `Release` build configuration when building the .NET app.
```yaml
...
parts:
    dotnet-webapi: 
        plugin: dotnet
        source-type: local
        source: .
        dotnet-build-configuration: Release # Here!
        ...
...
``` 

As scripts for building .NET app is now already defined by the plugin, we don't need to define `override-build`. So, let's have that property removed.

After that, your `parts` should looks like this so far.

```yaml
...
parts:
    dotnet-webapi: 
        plugin: dotnet
        source-type: local
        source: .
        dotnet-build-configuration: Release # Here!
        build-environment:
            - PATH: "/usr/bin:${PATH}"
        build-packages:
            - dotnet-sdk-8.0
        stage-packages:
            - aspnetcore-runtime-8.0
        # Note: No override-build!
...
``` 

On next step, We'll update `stage-packages` to use chisel slices.