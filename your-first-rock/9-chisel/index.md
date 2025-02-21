### Chiselling stage packages

Just like you can cut out woods and stones using chisel, We can also cut out only needed part of a debian package from Ubuntu archive to install it in the container image. Which would make the container image smaller and also minimize security attack surface.

Now, how we can do that? We use [chisel](https://documentation.ubuntu.com/chisel/en/latest/) for that.

While most people uses Chisel CLI to chisel debian packages for building contaienr images, or just use alrady chiselled container images as their base, Rockcraft has alredy chisel seamlessly integrated. Here, let's tell rockcraft to chisel our stage package `aspnetcore-runtime-8.0`.

#### Check chisel slices of a debian package.

First, we'll need to check what kind of slices are defined for `aspnetcore-runtime-8.0` package.

Run the command below to find the information.
```bash
chisel info aspnetcore-runtime-8.0
```

This will output follwing information. Which tells us the package we want to chisel has `copyright` and `libs` slices defined.
Looking at what kind of contents each slices includes, It seems like we will only need `libs` slices in our rock.
```bash
2025/02/22 00:14:41 Consulting release repository...
2025/02/22 00:14:41 Cached ubuntu-24.04 release is still up-to-date.
2025/02/22 00:14:41 Processing ubuntu-24.04 release...
package: aspnetcore-runtime-8.0
slices:
    copyright:
        contents:
            /usr/share/doc/aspnetcore-runtime-8.0/copyright: {}
    libs:
        essential:
            - aspnetcore-runtime-8.0_copyright
            - dotnet-runtime-8.0_libs
        contents:
            /usr/lib/dotnet/shared/Microsoft.AspNetCore.App/8.0*/**: {}
```

How we can tell rockcraft to install `libs` slice of `aspnetcore-runtime-8.0` package? It's simple. Just append `_<slice_name>` on the package name listed under `stage-package`. In our case, that would be appending `_libs` on `aspnetcore-runtime-8.0`.

After appending slice name, your `rockcraft.yaml`'s part should look like this.

```yaml

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
            - aspnetcore-runtime-8.0_libs # Now rockcraft will only install "libs" slice.
        # Note: No override-build!
...
``` 

On next step, let's also build then run this modified rock. Then finish this workshop!