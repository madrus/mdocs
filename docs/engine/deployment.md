
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

## Deployment to OPS-APP-01

## Website Configuration

The website external url is <https://devopdocs.fivedegrees.is>.

It is hosted in `IIS` on the `OPS-APP-01` server and its local URL is [http://localhost:8881](http://localhost:8881/).

---

## Deployment Procedure

!!! WARNING "You need to be Adminstrator"

    In order to be able to deploy the website, you need to have local administrator access on the `OPS-APP-01` server

Here are the step to follow:

- On your local machine:
  - Build the website locally: `mkdocs build`
- On the `OPS-APP-01`:
  - Log in on the server and open the `IIS Manager`
  - Stop the `FdsDocs` application pool
  - Delete the contents of the `C:\inetpub\wwwroot\fdsdocs` folder
- On your local machine:
  - Copy the contents of the `site` folder to `\\ops-app-01\c$\inetpub\wwwroot\fdsdocs`
- On the `OPS-APP-01`:
  - Start the `FdsDocs` application pool

Check the deployment:

- On the `OPS-APP-01`:
  - open [http://localhost:8881](http://localhost:8881/) and make sure you see the website
  - try to search for any reasonable search item to see a list of links
- On your local machine:
  - Open [http://ops-app-01:8881](http://ops-app-01:8881) and make sure you see the website
  - try to search for any reasonable search item to see a list of links

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

Open the IIS and click on `OPS-APP-01`. Among the features on the right, find and double-click `MIME Types`. If you miss the mime-type for `.mustache`, add it as `mustache: text/template`.

---
