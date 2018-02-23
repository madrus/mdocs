#!/bin/sh
mkdocs build
rm -rf c:/inetpub/wwwroot/mdocs
scp -r ./site c:/inetpub/wwwroot/mdocs
