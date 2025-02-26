### rock with bare base, .NET plugin and chisel slices 

On next steps, Let's modify the `rockcraft.yaml` we wrote before to use:
- `bare` base
- .NET plugin
- Chisel slices as staged dependencies

#### bare base

First, Let's update `version` on `rockcraft.yaml` to `'0.2'`.

```yaml
...
version: '0.2'
...
```

Let's also update `base` to `bare`.
On your `rockcraft.yaml`, Update `base` from

```yaml
...
base: ubuntu@24.04 # the base environment for this rock
...
```

To
```yaml
...
base: bare # the base environment for this rock
...
```

What is `bare` base by the way? `bare` base is similar to [`scratch`](https://hub.docker.com/_/scratch) on Docker image. Which means your rock shall have no baseline system.  

Check out [the detailed explanation on rockcraft documentation](https://documentation.ubuntu.com/rockcraft/en/stable/explanation/bases.html#bare-bases).

As we're now using `bare` base, we also need to define `build-base` to tell from which ubuntu release should rockcraft pull packages from. You can add `build-base` property like this.
```yaml
...
base: bare
build-base: ubuntu@24.04 # Use Ubuntu 24.04 as build base
...
``` 