### Let's define how rock will be built

Now, Let's work with `parts` section.

What are parts by the way? Accoring to [this explanation on Rockcraft documentation](https://documentation.ubuntu.com/rockcraft/en/stable/common/craft-parts/explanation/parts.html), parts are:

>In the Craft Parts framework, parts are descriptions of the components to be built and prepared for deployment in a payload, either individually or as part of a larger project containing many components.
>
>When the Craft Parts framework is used to process a part on behalf of a tool or library, it performs some or all of the steps described in the parts lifecycle: PULL, OVERLAY, BUILD, STAGE and PRIME.
>
>Not all of these steps may be needed for every use case, and tools that use the Craft Parts framework can skip those that are not appropriate for their purposes.

#### Defining `dotnet-webapi` part

On `rockcraft.yaml` rename `my-part` to `dotnet-webapi`

```yaml
...
parts:
    dotnet-webapi: # Was "my-part"
        plugin: nil
```        

Let's add source related properties that will be used to pull source for building our rock. While we can configure it to pull from remote git repository or other sources, we'll configure it to use local directory as source.

To do that, add `source-type` as `local` and `source` as `.`(current directory). Just like this.

```yaml
parts:
    dotnet-webapi: # Was "my-part"
        plugin: nil
        source-type: local
        source: .
```

Next, let's add `build` step relevant properties.

- `build-environment`: Environment variables that will be defined in the build environment.
  - Add `PATH: "/usr/bin:${PATH}"` under this property
- `build-packages`: Packages from Ubuntu archive to install for use during build.
  - Add `dotnet-sdk-8.0`
- `override-build`: Used for overrideing build commands. We'll be adding following commands

```yaml
override-build: |
    craftctl default
    dotnet restore
    dotnet build 
    dotnet publish -c Release -o ${CRAFT_PART_INSTALL}/
```

After adding 3 properties above, `dotnet-webapi` part should looks like below.
```yaml
parts:
    dotnet-webapi: # Was "my-part"
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
```