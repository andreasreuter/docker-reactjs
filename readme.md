# Purpose
React bundled in a Docker image. You can derive your customized Docker image from this public hosted Docker image. We bundle always the latest long term supported version of Node together with the latest version of React.

> This Docker image is not necessary to host your React app in a production environment because React does not need Node there.

### Latest React
16.8.6

### Latest Node
v10.16.0

## Custom init.sh
You should copy an init.sh file into your derived Docker image. A sample is documented below:

```
#!/bin/sh

nginx
yarn start
tail -f /var/log/lastlog
```

# Docker Instructions

## Infinite looped Docker
Go into code directory before you issue the script below. When Docker has started then you have to start all daemons by hand because init.sh script is ignored.

    docker run -P -v "`pwd`":/usr/share/nginx/html:rw \
      <local-image> \
      /bin/sh -c -- 'while true; do sleep 50; done;'

# Contributor Instructions
A warm welcome! Please read the contributor instructions below if you contribute to our open source program.

## Build a Docker image again
    docker build -t reactjs .

> Sometimes you have to remove packages from Docker image then you should build it again with the command below:

    docker build --no-cache -t reactjs .
