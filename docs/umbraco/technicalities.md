# Some technical details

[TOC]

## robots.txt

1. install [Cultiv DynamicRobots](https://our.umbraco.org/projects/website-utilities/cultiv-dynamicrobots/) and [Robots.txt Editor](http://our.umbraco.org/projects/developer-tools/robotstxt-editor) packages in the Umbraco backend.
2. (I am not yet sure if this is a good option) intall the [Cultiv SearchEngineSitemap](http://our.umbraco.org/projects/website-utilities/cultiv-search-engine-sitemap) package, which supports multisite solutions out of the box.
3. open Developer section in the backend and you will see `Robots.txt` option. Click on it. Now, you can enter the code you need. Here is an example of such file for Umbraco projects:

```none
    # robots.txt for Umbraco
    User-agent: *
    Disallow: /bin/
    Disallow: /config/
    Disallow: /css/
    Disallow: /data/
    Disallow: /scripts/
    Disallow: /umbraco/
    Disallow: /umbraco_client/
    Disallow: /usercontrols/
    Sitemap: http://{HTTP_HOST}/sitemap
```

The interesting part here is that the `{HTTP_HOST}` template parameter here is dynamically substituted for the right URL when the project is deployed.

!!! warning "Deployment error"
    Currently the `Cultiv.DynamicRobots.dll` file in the `bin` directory is not being copied by the deployment process and has to be separately copied later.

Alternatively, you could also create `robots.txt` manually in the project root directory and make sure the link `/robots.txt` is redirected to `/robotstxt` in `~\Config\UrlRewriting.config`. For details see this article: [How to create a robots.txt in Umbraco and edit it from the backoffice](https://glcheetham.name/2016/10/02/robotstxt-umbraco/)
