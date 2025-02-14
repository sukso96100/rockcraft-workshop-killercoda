### Creating a .NET Web API App project

Let's create a .NET Web API App project code that we are going build it as a rock.

Use `dotnet new` to crate a new project from specified template.
```bash
dotnet new webapi -o dotnet-webapi
cd dotnet-webapi
```

Before try to run it, We need to update `dotnet-webapi.http` in the created project directory.   
Open the file then update value of `@dotnet_webapi_HostAddress` to `http://localhost:5000` (You may use the editor tab to work with code)

Then, Let's also try to run it.
```bash
dotnet run
```

While your .NET app is running, click links below to see what does the app do.
- [http://localhost:5000/weatherforecast]({{TRAFFIC_HOST1_5000}}/weatherforecast)
- [http://localhost:5000/swagger]({{TRAFFIC_HOST1_5000}}/swagger)
