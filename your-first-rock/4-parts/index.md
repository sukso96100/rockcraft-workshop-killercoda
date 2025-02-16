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