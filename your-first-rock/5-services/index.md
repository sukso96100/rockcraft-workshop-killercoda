### Defining how rock will run

As we have defined parts, Let's define services and some other properties for runtime.

#### Defining service

Let's define [services](https://documentation.ubuntu.com/rockcraft/en/stable/reference/rockcraft.yaml.html#services) that will be used to configure [pebble](https://documentation.ubuntu.com/pebble/reference/layer-specification/) which is the entrypoint of every rocks.

On top level of `rockcraft.yaml`, define `services`. then add service with name `dotnet-webapi` like below.

```yaml
...
services:
    dotnet-webapi:
        ...
...
```
For `dotnet-webapi` service, let's add `command`, `override` and `startup`.
- `override`: Determines what to do if there are any services with the same name from other pebble layers. Either `merge` or `replace` can be used.
  - We'll be using `replace` here. So that we can only have our service defined in `rockcraft.yaml` applied
- `startup`: Like the name says, this property is used to determine whether start the service when pebble starts or not. 
  - Set this as `enabled` as we want to start our .NET app when the rock(container) starts.
- `command`: The commane to run. 
  - `dotnet dotnet-webapi.dll`

After adding above, your service definition should look like this.

```yaml
...
services:
    dotnet-webapi:
        override: replace
        startup: enabled
        command: dotnet dotnet-webapi.dll
...
```

#### Image environment variables

Lastly, we are going to add an environment variable. To make sure our .NET app can listen incoming connections, We'll set `ASPNETCORE_URLS=http://0.0.0.0:8080`.

To do that, add [`environment`](https://documentation.ubuntu.com/rockcraft/en/stable/reference/rockcraft.yaml.html#environment) on top level (just like `services`) then add the environment variable in key value form.

```yaml
...
environment:
    ASPNETCORE_URLS: http://0.0.0.0:8080

services:
    dotnet-webapi:
        override: replace
        startup: enabled
        command: dotnet dotnet-webapi.dll
...
```

We're now done with writing a `rockcraft.yaml` for our .NET app. On next step, let's build a rock then run it with docker.