#!/bin/sh
mkdocs build --clean
rm -rf c:/inetpub/wwwroot/mdocs
#scp -r ./site c:/inetpub/wwwroot/mdocs
