# Purpose
React bundled in a Docker image. You can derive your customized Docker image from this public hosted Docker image. We bundle always the latest long term supported version of Node together with the latest version of React.

> This Docker image is not necessary to host your React app in a production environment because React does not need Node there.

## Custom init.sh
You should copy an init.sh file into your derived Docker image. A sample is documented below:

```
#!/bin/sh

nginx
yarn start
tail -f /var/log/lastlog
```

# Latest React
16.8.6

# Latest Node
v10.16.0
