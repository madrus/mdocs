# .NET Core Tips

### dotnet command prompt

Run the web application on a specified port, e.g. 10000, via

```bash
dotnet run --server.urls http://127.0.0.1:10000
```

---

### Dotnet NuGet Packages

Using command `dotnet pack` we can actually create a __NuGet__ package from our project. This command will create two files in `bin/debug/[runtime]` directory:

* `DNXConsoleDemo.1.0.0.nupkg`
* `DNXConsoleDemo.1.0.0.symbols.nupkg`

Actually, the `.nupkg` files are just `.zip` files. If you rename the extension, you can see what is inside the package.

!!! important "Application as a NuGet package"
    It should now be possible to install your project as a NuGet package.

---

### Some Definitions

__ASP.NET Services__ = objects that provide functionality to other parts of the application. Services registered in the `Startup.ConfigureServices` method can be accessed by creating a constructor that accepts an argument of the required service type.

__ConfigureServices__ method hooks into the service registry all of the services we want our application to make use of. It is configuring the types of services that can be used in the infrastructur altogether.

__Configure__ methods configures the behavior of the registered services.

__Middleware__ = components that are combined to form the __request pipeline__.

__AddTransient__ = every time we call for the service to be used, we would get a new instance of the service from the __DI Framework__.

__AddScoped__ = same instance of the service is used in all stages of the middleware pipeline for the same request.

__AddSingleton__ = one instance of the service is created for the entire lifetime of the application across all user requests.

__AddInstance__ = similar to AddSingleton but we need to new up the instance of this service explicitly.

---

### Some Facts

* JSON schema of the `project.json` file: [json.schemastore.org/project](http://json.schemastore.org/project)
* It is possible to use more that one `Startup` class, e.g. `Startup`, `StartupFoo`, `StartupBar`, and to specify the one we need to be activated in the `Program.cs`:

```csharp
  public static void Main(string[] args)
  {
      var host = new WebHostBuilder()
          ...
          .UseStartup<Startup>()
          ...
  }
```
