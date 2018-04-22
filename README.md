# Clair container scan
## Overview
Automatically scan all local docker containers with [Clair Vulnerability Scanner](https://github.com/coreos/clair) using [Clair-Scanner](https://github.com/arminc/clair-scanner).
## Quick start
To get json output of the clair scan of all running containers to standard out just run:
```bash
docker-compose run --rm scanner 2>/dev/null && docker-compose down >/dev/null 2>&1
```
