### Time for rockcraft.yaml

Now that we got some .NET App code that we'll be building as a rock, Let's create `rockcraft.yaml` then see how does it look like.

Run following command to create a `rockcraft.yaml` file.
```bash
rockcraft init
```

Now, let's open it. It should looks like this.

```yaml
name: dotnet-webapi
# see https://documentation.ubuntu.com/rockcraft/en/1.8.0/explanation/bases/
# for more information about bases and using 'bare' bases for chiselled rocks
base: ubuntu@24.04 # the base environment for this rock
version: '0.1' # just for humans. Semantic versioning is recommended
summary: Single-line elevator pitch for your amazing rock # 79 char long summary
description: |
    This is dotnet-webapi's description. You have a paragraph or two to tell the
    most important story about it. Keep it under 100 words though,
    we live in tweetspace and your description wants to look good in the
    container registries out there.
platforms: # the platforms this rock should be built on and run on
    amd64:

parts:
    my-part:
        plugin: nil
```

Let's update some metadata of this `rockcraft.yaml`file. but maybe not `name`, `base`, `version` fields which already looks good. So, let's update `summary` and `description` like this. (or with your own text)

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

parts:
    my-part:
        plugin: nil
```

`parts` section by the way is used for defining how a rock(contaienr) is built. We'll have a closer look on this on next step.