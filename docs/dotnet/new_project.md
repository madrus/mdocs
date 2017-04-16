# Workflow with an new ASP.NET Core MVC Project

### .NET Core Prerequisites

Ideally, you have to have a number of components installed on your system (Windows | Linux | MacOS):

* .NET Core
* .NET Core SDK
* Node.js

---

### Create a new minimal ASP.NET Core project

!!! warning "IMPORTANT!"
    When working with Visual Studio as IDE, make sure that - __AT ALL TIMES!__ - you can run your application both from inside the Visual Studio by pressing `Ctrl + F5`, and from the command prompt by executing `dotnet run` command.

#### Dotnet Command Line Version

* Create a new project directory and CD to it:

  `mkdir myproj && cd myproj`

* Create the default initial project:

  `dotnet new`

* Restore the default dependencies:

  `dotnet restore`

* Run the project and see the __Hello World!__ message:

  `dotnet run`

#### Visual Studio 2015 Version

Start Visual Studio. Click on `File | New | Project`. In the `Templates` choose `Visual C# | .NET Core` and then `ASP.NET Core Web Application (.NET Core)`. Browse to the root location for your new solution. Choose a nice name for it, e.g. __MyGreatApp__. Click the `OK` button. Choose now the empty ASP.NET Core template.

The solution is created. Wait for the dependencies to be installed. Build and run the solution with `Ctrl + F5`. When the browser starts, you will see the __Hello World!__ message.

You can also start the command prompt in the `MyGreatApp/Src/MyGreatApp` folder. Run this command:

`dotnet restore && dotnet run`

Browse to the [localhost:5000](http://localhost:5000) and you will see the __Hello World!__ message.

#### Dependencies

!!! important "Versions are constantly changing"
    ASP.NET Core is constantly being developed and new versions of different components are being released. Therefore, the versions stated below can get outdated at any moment. If you wish to upgrade a version, you have to install the referenced component first.

#### Project.json

You can start with this configuration:

```json
{
    "version": "1.0.0-*",
    "description": "Your best description of the application",
    "authors": [ "Your Name" ],
    "packOptions": {
        "tags": [ "" ],
        "projectUrl": "",
        "licenseUrl": ""
    },

    "dependencies": {
        "Microsoft.NETCore.App": {
            "version": "1.1.*",
            "type": "platform"
        },
        "Microsoft.AspNetCore.Diagnostics": "1.1.0",
        "Microsoft.AspNetCore.Mvc": "1.1.0",
        "Microsoft.AspNetCore.Razor.Tools": {
            "version": "1.1.0-preview4-final",
            "type": "build"
        },
        "Microsoft.AspNetCore.Server.IISIntegration": "1.1.0",
        "Microsoft.AspNetCore.Server.Kestrel": "1.1.0",
        "Microsoft.AspNetCore.StaticFiles": "1.1.0",
        "Microsoft.Extensions.Logging.Console": "1.1.0",
        "Microsoft.VisualStudio.Web.BrowserLink.Loader": "14.1.0",
        "System.Net.Http": "4.3.0"
    },

    "tools": {
        "Microsoft.AspNetCore.Server.IISIntegration.Tools": "1.0.0-preview2-final"
    },

    "frameworks": {
        "netcoreapp1.0": {
            "imports": [
                "dotnet5.6",
                "portable-net45+win8",
                "dnxcore50"
            ]
        }
    },

    "buildOptions": {
        "emitEntryPoint": true,
        "preserveCompilationContext": true
    },

    "runtimes": {
        "win81-x64": {},
        "win7-x64": {},
        "osx.10.12-x64": {}
    },

    "runtimeOptions": {
        "configProperties": {
            "System.GC.Server": true
        }
    },

    "publishOptions": {
        "include": [
            "wwwroot",
            "web.config"
        ]
    },

    "scripts": {
        "postpublish": [
          "dotnet publish-iis --publish-folder %publish:OutputPath% --framework %publish:FullTargetFramework%"
        ]
    }
}
```

#### Global.json

When you install the .NET Core SDK on Windows, it shows up in `C:\Program Files\dotnet\sdk` folder. Using the __"sdk"__ option, we can override the default version.

```json
{
  "projects": [ "src", "test" ],
  "sdk": {
    "version": "1.0.0-preview2-1-003177"
  }
}
```

#### Bower.json

If you need __Bootstrap 3__ for the styling of your website, add this `bower.json` file in the project root.

```json
{
    "name": "asp.net",
    "private": true,
    "dependencies": {
      "bootstrap": "3.3.*"
    }
}
```

#### Program.cs

```csharp
using Microsoft.AspNetCore.Hosting;
using System.IO;

namespace NNMeta
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var host = new WebHostBuilder()
                .UseKestrel()
                .UseContentRoot(Directory.GetCurrentDirectory())
                .UseIISIntegration()
                .UseStartup<Startup>()
                .Build();

            host.Run();
        }
    }
}
```

#### Startup.cs

```csharp
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;

namespace NNMeta
{
    public class Startup
    {
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddMvc();
        }

        public void Configure(IApplicationBuilder app, IHostingEnvironment env, ILoggerFactory loggerFactory)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseStaticFiles();
            app.UseMvcWithDefaultRoute();
        }
    }
}
```

---

#### Controllers/HomeController.cs

```csharp
using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;

namespace NNMeta.Controllers
{
    public class HomeController : Controller
    {
        public ViewResult Index()
            => View(new Dictionary<string, string>
            {
                ["Message1"] = "This is the first message from the Index action",
                ["Message2"] = "This is the second message from the Index action"
            });
    }
}
```

#### Views/_ViewImports.cshtml

```html
@addTagHelper *, Microsoft.AspNetCore.Mvc.TagHelpers
```

#### Views/Home/Index.cshtml

```html
@model Dictionary<string, string>
@{ Layout = null; }
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width" />
  <link asp-href-include="~/lib/bootstrap/dist/css/*.min.css" rel="stylesheet" />
  <title>Result</title>
</head>
<body class="panel-body">
  <table class="table table-condensed table-bordered table-striped">
    <tr>
      @foreach (var kvp in Model)
      {
          <th>@kvp.Key</th>
      }
    </tr>
    <tr>
      @foreach (var kvp in Model)
      {
          <td>@kvp.Value</td>
      }
    </tr>
  </table>
</body>
</html>
```
