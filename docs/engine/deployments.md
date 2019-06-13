# PowerShell Deployments

This section describes some tips for Windows users.

## Deployment to your local IIS

You can host the website automatically in the local `IIS` as [http://localhost:1111](http://localhost:1111). That is done by the `deploy_to_local_iis.ps1` script.

Here are the steps:

- make sure you have `IIS` installed on your notebook; if necessary, add the corresponding Windows 10 features
- run `Visual Studio Code` as `Administrator` (necessary for running PowerShell scripts with elevated rights)
- open the project in `Visual Studio Code`
- from the file tree on the left, open the `deploy_to_local_iis.ps1` script (you can find in the root of the project) and keep it as your currently open window
- go to the `debugger` mode in the menu on the left (click the `bug` icon)
- in the debug options above, choose `PowerShell Launch Current File` and click on the green triangle

Alternatively, open a PowerShell console as `Administrator` and run the following commands:

``` powershell
Change-Location C:\To\The\Project\Root\Folder
.\deploy_to_local_iis.ps1
```

Now, you should be able to see the website by browsing to [http://localhost:1111](http://localhost:1111).

---

## Possible Issues

### Cannot find drive 'IIS'

When running a deployment PowerShell script, you get the error message:

``` none
Cannot find drive. A drive with the name 'IIS' does not exist.
```

You are probably running the script without the elevated rights. Try running the script as `Administrator`.

### Missing MIME-types

If the search does not work and in the DevTools you see a 404-error on `./mkdocs/js/search-results-template.mustache`, this can mean that a mime-type is missing for `.mustache`

Open the IIS Manager and click on the root node. Among the features on the right, find and double-click `MIME Types`. If you miss the mime-type for `.mustache`, add it as `mustache: text/template`.

---
